import Combine
import Foundation
import SwiftUI

import NamiApple
import StoreKit

class NamiDataSource: ObservableObject {
    @Published var isLoggedIn = NamiCustomerManager.isLoggedIn()
    @Published var loggedInId = NamiCustomerManager.loggedInId()
    @Published var deviceId = NamiCustomerManager.deviceId()
    @Published var showLinkedPaywall = false
    @Published var activeEntitlements: [NamiEntitlement] = []
    @Published var journeyState: CustomerJourneyState? = NamiCustomerManager.journeyState()
    @Published var campaigns: [NamiCampaign] = NamiCampaignManager.allCampaigns()

    func updateLoggedInStatus() {
        self.isLoggedIn = NamiCustomerManager.isLoggedIn()
        self.loggedInId = NamiCustomerManager.loggedInId()
        self.deviceId = NamiCustomerManager.deviceId()
    }

    init() {
        if #available(iOS 15.0, macOS 12.0, *) {
            if !Nami.shared.isPurchaseManagementEnabled() {
                StoreKit2TransactionObserver()
            }
        }

        if #available(iOS 15.0, tvOS 15.0, *) {
            NamiPaywallManager.registerBuySkuHandler { sku in
                print("BYO billing buySkuHandler \(sku.storeId)")
                NamiPaywallManager.dismiss(animated: true) {}
                Task {
                    let productIdentifiers = [sku.storeId]
                    if let products = try? await Product.products(for: productIdentifiers) {
                        print("\(products)")
                        let product = products[0]

                        let purchaseResult = try await product.purchase(options: [
                            .appAccountToken(UUID()),
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

        NamiCustomerManager.setCustomerAttribute("firstName", "Dan")
        NamiCustomerManager.setCustomerAttribute("fooxyz", "bar123")

        updateLoggedInStatus()

        // This handler is called when campaigns are loaded for the device
        NamiCampaignManager.registerAvailableCampaignsHandler { campaigns in
            self.campaigns = campaigns.sorted(by: { $0.value ?? "" < $1.value ?? "" })
        }

        // This handler is called when a paywall is closed
//        NamiPaywallManager.registerCloseHandler { paywall in
//            if let paywallVC = paywall {
//                paywallVC.dismiss(animated: true)
//            } else {
//                print("no paywall sent to registerCloseHandler")
//            }
//        }

        // This handler is called whenever customer journey state is received from the Nami service
        NamiCustomerManager.registerJourneyStateHandler { journeyState in
            self.journeyState = journeyState
        }

        // This handler is called whenever the latest active entilements state is received from the Nami service
        NamiEntitlementManager.registerActiveEntitlementsHandler { (activeEntitlements: [NamiEntitlement]) in
            self.activeEntitlements = activeEntitlements
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
                } else if accountStateAction == .advertising_id_set {
                    print("advertising id set")
                } else if accountStateAction == .vendor_id_set {
                    print("vendor id set")
                } else if accountStateAction == .customer_data_platform_id_set {
                    print("cdp id set")
                } else if accountStateAction == .advertising_id_cleared {
                    print("advertising id cleared")
                } else if accountStateAction == .vendor_id_cleared {
                    print("vendor id cleared")
                } else if accountStateAction == .customer_data_platform_id_cleared {
                    print("cdp id cleared")
                }
            } else if error != nil {
                if accountStateAction == .login {
                    print("error logging in - \(String(describing: error))")
                } else if accountStateAction == .logout {
                    print("error logging out - \(String(describing: error))")
                } else if accountStateAction == .advertising_id_set {
                    print("error setting advertising id - \(String(describing: error))")
                } else if accountStateAction == .vendor_id_set {
                    print("error setting vendor id - \(String(describing: error))")
                } else if accountStateAction == .customer_data_platform_id_set {
                    print("error setting cdp id - \(String(describing: error))")
                } else if accountStateAction == .advertising_id_cleared {
                    print("error clearing advertising id - \(String(describing: error))")
                } else if accountStateAction == .vendor_id_cleared {
                    print("error clearing vendor id - \(String(describing: error))")
                } else if accountStateAction == .customer_data_platform_id_cleared {
                    print("error clearing cdp id - \(String(describing: error))")
                }
            }
        }

        NamiCustomerManager.setCustomerDataPlatformId(with: UUID().uuidString)
        NamiCustomerManager.clearCustomerDataPlatformId()

        NamiCustomerManager.setAdvertisingId(with: UUID())
        NamiCustomerManager.clearAdvertisingId()

        NamiCustomerManager.setVendorId(with: UUID())
        NamiCustomerManager.clearVendorId()

        // This handler is called when sign-in control on paywall is tapped
        NamiPaywallManager.registerSignInHandler { _ in
            NamiPaywallManager.dismiss(animated: true) {}
        }

        NamiPaywallManager.registerRestoreRequestHandler {
            print("registerRestoreRequestHandler from paywalls only plans \n")
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
            #if os(iOS)
                let impactMed = UIImpactFeedbackGenerator(style: .soft)
                impactMed.impactOccurred()
            #endif

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
//                    let alert = UIAlertController(title: "Restore Purchase", message: "No previous purchases to restore", preferredStyle: UIAlertController.Style.alert)
//                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//
//                    // if restore was called from a Nami Paywall we can present an alert there
//                    if let paywallVc = presentAlertFromVC {
//                        paywallVc.present(alert, animated: true, completion: nil)
//                    } else {}
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
