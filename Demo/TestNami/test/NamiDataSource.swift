import Combine
import Foundation
import SwiftUI

import NamiApple
import StoreKit

class NamiDataSource: ObservableObject {
    @Published var purchaseManagementEnabled = Nami.isPurchaseManagementEnabled()
    @Published var anonymousModeCapable = NamiCustomerManager.anonymousModeCapability()
    @Published var isLoggedIn = NamiCustomerManager.isLoggedIn()
    @Published var loggedInId = NamiCustomerManager.loggedInId()
    @Published var deviceId = NamiCustomerManager.deviceId()
    @Published var anonymousMode = NamiCustomerManager.inAnonymousMode()
    @Published var activeEntitlements: [NamiEntitlement] = []
    @Published var journeyState: CustomerJourneyState? = NamiCustomerManager.journeyState()
    @Published var campaigns: [NamiCampaign] = NamiCampaignManager.allCampaigns()

    func updateLoggedInStatus() {
        isLoggedIn = NamiCustomerManager.isLoggedIn()
        loggedInId = NamiCustomerManager.loggedInId()
        deviceId = NamiCustomerManager.deviceId()
        anonymousMode = NamiCustomerManager.inAnonymousMode()
        journeyState = NamiCustomerManager.journeyState()
    }

    init() {
        if #available(iOS 15.0, tvOS 15.0, *) {
            NamiPaywallManager.registerBuySkuHandler { _ in
                // Subscription Studio customers implement this handler. If you are on Subscription Studio+, this is not necessary.
                print("For customers implementing Nami paywalls with their own billing code or third-party such as RevenueCat.")
            }
        }

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
        // For Subscription Studio+ customers using Nami's purchase engine
        NamiCustomerManager.registerJourneyStateHandler { journeyState in
            self.journeyState = journeyState
        }

        // This handler is called whenever the latest active entilements state is received from the Nami service
        // For Subscription Studio+ customers using Nami's purchase engine
        NamiEntitlementManager.registerActiveEntitlementsHandler { (activeEntitlements: [NamiEntitlement]) in
            self.activeEntitlements = activeEntitlements
        }

        NamiCustomerManager.registerAccountStateHandler { accountStateAction, success, error in

            self.isLoggedIn = NamiCustomerManager.isLoggedIn()
            self.loggedInId = NamiCustomerManager.loggedInId()
            self.deviceId = NamiCustomerManager.deviceId()
            self.anonymousMode = NamiCustomerManager.inAnonymousMode()
            self.journeyState = NamiCustomerManager.journeyState()

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
                } else if accountStateAction == .anonymous_mode_on {
                    print("anonymous mode on")
                } else if accountStateAction == .anonymous_mode_off {
                    print("anonymous mode off")
                } else if accountStateAction == .nami_device_id_set {
                    print("nami device id set")
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
                } else if accountStateAction == .anonymous_mode_on {
                    print("error turning anonymous mode on - \(String(describing: error))")
                } else if accountStateAction == .anonymous_mode_off {
                    print("error turning anonymous mode off - \(String(describing: error))")
                } else if accountStateAction == .nami_device_id_set {
                    print("nami device id set - \(String(describing: error))")
                }
            }
        }

        // This handler is called when sign-in control on paywall is tapped
        NamiPaywallManager.registerSignInHandler { _ in
            if Nami.namiWindowEnabled() {
                NamiPaywallManager.hide()
            } else {
                NamiPaywallManager.dismiss(animated: true) {}
            }
        }

        NamiPaywallManager.registerRestoreHandler {
            // For Subscription Studio customers not using Nami's purchase engine
            print("registerRestoreRequestHandler from paywalls only plans \n")
        }

        NamiPurchaseManager.registerPurchasesChangedHandler { purchases, purchaseState, _ in
            // For Subscription Studio+ customers using Nami's purchase engine
            print("purchasesChangesHandler \(purchaseState)\n")
            for purchase in purchases {
                print("purchased sku_ref_id: \(purchase.skuId)\n")
                print("purchased transaction id: \(String(describing: purchase.transactionIdentifier))\n")

                if let originalTransactionID = purchase.originalTransactionId {
                    print("purchased original transaction id: \(originalTransactionID)\n")
                }
            }
        }

        NamiPurchaseManager.registerRestorePurchasesHandler { state, newPurchases, oldPurchases, _ in
            #if os(iOS)
                let impactMed = UIImpactFeedbackGenerator(style: .soft)
                impactMed.impactOccurred()
            #endif

            _ = NamiPaywallManager.displayedViewController()

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
