import Combine
import Foundation
import SwiftUI

import NamiApple

// Third-party analytics integration
// import TelemetryClient

// Sign in with Apple
import AuthenticationServices

import StoreKit

class NamiDataSource: ObservableObject {
    @Published var isLoggedIn = NamiCustomerManager.isLoggedIn()
    @Published var loggedInId = NamiCustomerManager.loggedInId()
    @Published var deviceId = NamiCustomerManager.deviceId()
    @Published var showLinkedPaywall = false
    @Published var linkedPaywallProducts: [NamiSKU]?
    @Published var linkedPaywallMetadata: NamiPaywall?
    @Published var activeEntitlements: [NamiEntitlement] = []
    @Published var journeyState: CustomerJourneyState? = NamiCustomerManager.journeyState()
    @Published var campaigns: [NamiCampaign] = NamiCampaignManager.allCampaigns()

//    let publisher = PassthroughSubject<[NamiEntitlement], Never>()

    func updateLoggedInStatus() {
        let keychain = UserDataKeychain()
        var keychainUserData: UserData?

        print("current local deviceId: \(deviceId)")
        print("current local isLoggedIn: \(isLoggedIn)")
        print("current NamiCustomerManager isLoggedIn: \(NamiCustomerManager.isLoggedIn())")

        do {
            keychainUserData = try keychain.retrieve()
        } catch {
//            if self.isLoggedIn {
//                NamiCustomerManager.logout()
//            }
        }

        if let userData = keychainUserData {
            let provider = ASAuthorizationAppleIDProvider()
            provider.getCredentialState(forUserID: userData.identifier) { state, _ in
                switch state {
                case .authorized:
                    if NamiCustomerManager.isLoggedIn() == false {
                        NamiCustomerManager.login(withId: userData.identifier)
                    }
                case .revoked:
                    if NamiCustomerManager.isLoggedIn() == true {
                        NamiCustomerManager.logout()
                    }
                case .notFound:
                    if NamiCustomerManager.isLoggedIn() == true {
                        NamiCustomerManager.logout()
                    }
                case .transferred:
                    break
                @unknown default:
                    break
                }
            }
        }
    }

    init() {
        if #available(iOS 15.0, macOS 12.0, *) {
            if !Nami.shared.purchaseManagementEnabled {
                StoreKit2TransactionObserver()
            }
        }

        isLoggedIn = NamiCustomerManager.isLoggedIn()

        // This handler is called when campaigns are loaded for the device
        NamiCampaignManager.registerAvailableCampaignsHandler { campaigns in
            self.campaigns = campaigns.sorted(by: { $0.value ?? "" < $1.value ?? "" })

            if NamiCampaignManager.isCampaignAvailable() == true {
                print("we have a default campaign")
            } else {
                print("we don't have a default campaign")
            }

            if NamiCampaignManager.isCampaignAvailable(label: "penguin") == true {
                print("we have a 'penguin' label campaign")
            } else {
                print("we don't have a 'penguin' label campaign")
            }
        }

        // This handler is called when a paywall is closed
        NamiPaywallManager.registerCloseHandler { paywall in
            if let paywallVC = paywall {
                paywallVC.dismiss(animated: true)
            }
        }

        // This handler is called whenever customer journey state is received from the Nami service
        NamiCustomerManager.registerJourneyStateHandler { journeyState in
            self.journeyState = journeyState
        }

        // This handler is called whenever the latest active entilements state is received from the Nami service
        NamiEntitlementManager.registerActiveEntitlementsHandler { (activeEntitlements: [NamiEntitlement]) in
            self.activeEntitlements = activeEntitlements
        }

        // This handler is called when a campaign is launched that points to a Linked Paywall
        NamiPaywallManager.renderCustomUiHandler { (products: [NamiSKU]?, paywallMetadata: NamiPaywall?) in
            self.showLinkedPaywall = true

            if let skus = products {
                self.linkedPaywallProducts = skus
            }
            if let paywallMeta = paywallMetadata {
                self.linkedPaywallMetadata = paywallMeta
            }
        }

        NamiCustomerManager.registerAccountStateHandler { accountStateAction, success, error in

            self.isLoggedIn = NamiCustomerManager.isLoggedIn()
            self.loggedInId = NamiCustomerManager.loggedInId()
            self.deviceId = NamiCustomerManager.deviceId()

            if success {
                if accountStateAction == .login {
                    // logged in
                    print("success logging in")
                } else if accountStateAction == .logout {
                    // logged out
                    print("success logging out")
                }
            } else if error != nil {
                if accountStateAction == .login {
                    print("error logging in - \(String(describing: error))")
                } else if accountStateAction == .logout {
                    print("error logging out - \(String(describing: error))")
                }
            }
        }

        // This handler is called when sign-in control on paywall is tapped
        NamiPaywallManager.registerSignInHandler { _ in
            NamiPaywallManager.dismiss(animated: true) {}
        }

        if #available(iOS 15.0, *) {
            NamiPaywallManager.registerBuySkuHandler { sku in
                print("BYO billing buySkuHandler \(sku.storeId)")
                Task {
                    let productIdentifiers = [sku.storeId]
                    if let products = try? await Product.products(for: productIdentifiers) {
                        print("\(products)")

                        if let appToken = UUID(uuidString: NamiCustomerManager.deviceId()) {
                            let product = products[0]

                            let purchaseResult = try await product.purchase(options: [
                                .appAccountToken(appToken),
                            ])

                            switch purchaseResult {
                            case .pending:
                                print("pending purchase result")
                            case let .success(verification):
                                switch verification {
                                case let .verified(transaction):
                                    await transaction.finish()

                                    #if swift(>=5.7)
                                        let price = product.price
                                        let currency = product.priceFormatStyle.currencyCode
                                        let locale = product.priceFormatStyle.locale

                                        let purchaseSuccess = NamiPurchaseSuccess(product: sku, transactionID: String(transaction.id), originalTransactionID: String(transaction.originalID), originalPurchaseDate: transaction.originalPurchaseDate, purchaseDate: transaction.purchaseDate, expiresDate: transaction.expirationDate, price: price, currencyCode: currency, locale: locale)
                                        NamiPaywallManager.buySkuComplete(purchaseSuccess: purchaseSuccess)
                                    #endif

//                                    NamiPaywallManager.buySkuComplete(sku: sku, product: product, transaction: transaction)

                                    print("verified \(transaction)")
                                case .unverified:
                                    print("unverified")
                                }
                            case .userCancelled:
                                print("user cancelled")
                            @unknown default:
                                print("unexpected result")
                            }
                        }
                    }
                }
            }
        }

        // This handler is called whenever certain analytics information is made available by Nami for transmittal to
        // a third-party anaylytics package. Your Nami organization needs permission
        NamiAnalyticsSupport.registerAnalyticsHandler { (actionType: NamiAnalyticsActionType, analyticsItems: [String: Any]) in

            // Look at the action type to determine what values to log.
            switch actionType {
            case .paywallRaise:
                var detailData: [String: String] = [:]

                if let products = analyticsItems["paywallProducts"] as? [NamiSKU] {
                    let productList: String = products.reduce("") { result, product -> String in
                        if result.isEmpty {
                            return product.skuId
                        } else {
                            return result + "," + product.skuId
                        }
                    }
                    detailData["paywallProducts"] = productList
                }

                if let paywallID = analyticsItems[NamiAnalyticsKeys.paywall] as? String {
                    detailData["paywall"] = paywallID
                }
                if let paywallType = analyticsItems[NamiAnalyticsKeys.paywallType] as? String {
                    detailData["paywallType"] = paywallType
                }
                if let campaignRuleID = analyticsItems[NamiAnalyticsKeys.campaignRule] as? String {
                    detailData["campaignRule"] = campaignRuleID
                }
                if let campaignSegment = analyticsItems[NamiAnalyticsKeys.campaignSegment] as? String {
                    detailData["campaignSegment"] = campaignSegment
                }
                if let campaignValue = analyticsItems[NamiAnalyticsKeys.campaignValue] as? String {
                    detailData["campaignValue"] = campaignValue
                }
                if let campaignType = analyticsItems[NamiAnalyticsKeys.campaignType] as? String {
                    detailData["campaignType"] = campaignType
                }

//                TelemetryManager.send("paywallImpression", with: detailData)

            case .purchaseActivity:
                var purchaseData: [String: String] = [:]
                if let product: NamiSKU = analyticsItems[NamiAnalyticsKeys.purchasedSKU] as? NamiSKU {
                    purchaseData["productID"] = product.skuId
                    if let regionCode = product.product?.priceLocale.regionCode {
                        purchaseData["productLocale"] = regionCode
                    }
                }
                if let purchasePrice = analyticsItems[NamiAnalyticsKeys.purchasedSKUPrice] as? Double {
                    purchaseData["productPrice"] = "\(purchasePrice)"
                }
//                TelemetryManager.send("productTransaction", with: purchaseData)
            @unknown default:
                break
            }
        }

        NamiPurchaseManager.registerPurchasesChangedHandler { purchases, purchaseState, _ in
            print("purchasesChangesHandler \(purchaseState)\n")
            for purchase in purchases {
                print("purchased sku_ref_id: \(purchase.skuId)\n")
                print("purchased transaction id: \(purchase.transactionIdentifier)\n")

                if let originalTransactionID = purchase.transaction?.original?.transactionIdentifier {
                    print("purchased original transaction id: \(originalTransactionID)\n")
                }
            }
        }

        NamiPurchaseManager.registerRestorePurchasesHandler { state, newPurchases, oldPurchases, _ in
            let impactMed = UIImpactFeedbackGenerator(style: .soft)
            impactMed.impactOccurred()

            let presentAlertFromVC = NamiPaywallManager.displayedViewController()

            print("newPurchases \(newPurchases) oldpurchases \(oldPurchases)")

            switch state {
            case .started:
                print("starting restoring purchases")
            case .finished:
                // additionally may want to check that there are more items in
                // newPurchases than oldPurchases
                if oldPurchases != newPurchases {
                    print("Found restored purchases")
                    NamiPaywallManager.dismiss(animated: true) {}
                } else {
                    let alert = UIAlertController(title: "Restore Purchase", message: "No previous purchases to restore", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

                    // if restore was called from a Nami Paywallm we can present an alert there
                    if let paywallVc = presentAlertFromVC {
                        paywallVc.present(alert, animated: true, completion: nil)
                    } else {}
                }
            case .error:
                print("error restoring purchases")
            default:
                print("unknown case")
            }
        }

        NamiPurchaseManager.restorePurchases()
    }
}
