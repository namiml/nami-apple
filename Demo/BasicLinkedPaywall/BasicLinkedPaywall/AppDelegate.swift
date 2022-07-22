//
//  AppDelegate.swift
//  BasicLinkedPaywall
//
//  Created by Kendall Gelner on 5/25/21.
//  Copyright © 2021 Nami ML Inc. All rights reserved.
//

import UIKit
import Nami

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    private var paywallCanRaise = false
    
    func namiSetup() {
        // Makes sure when the app is re-run that any stored bypass purchases are cleared out so we can retry purchases
        // Note this cannot clear out StoreKit sandbox or regular purchaes, which Apple controls.
        // This only clears out purchases made when bypassStoreKit is enabled, or simulator purchases.
        // NamiPurchaseManager.clearBypassStorePurchases()
        
        // This is the appID for a Nami test application with already configured products and paywalls, contact Nami to obtain an Application ID for your own application.
        let namiConfig = NamiConfiguration(appPlatformID: "54635e21-87ed-4ed6-9119-9abb493bc9b0")
        
        namiConfig.logLevel = .debug

        // For testing you can bypass StoreKit for purchases if you desire.
        // Xcode 12 and iOS 14 simualtors now support purchases, so we'll leave this off.
        namiConfig.bypassStore = false
        
        Nami.configure(namiConfig: namiConfig )
                
        // If your applcation supports user sign-in, this callback asks you to build and present your login UI - it would be invoked from a sign-in link on the paywall.
        NamiPaywallManager.registerSignInHandler { (fromVC, developerPaywallID, paywallMetadata) in
            // Present any sign in UI from here to validate the user has an account already in your system.
        }
        
        
        // The Nami Control Center defines a paywall that automatically raises every session, which means every time the app is opened - here we show how to customize that behaviour by blocking the paywall auto-raise on firts launch of the app, but allowing if the applciation is suspended and opened again without terminating the app.
        NamiPaywallManager.registerAllowAutoRaisePaywallHandler {
            // Block auto-raise for first app open, allow if app is suspended and resumed.
            if !self.paywallCanRaise {
                self.paywallCanRaise = true
                return false
            } else {
                return true
            }
        }
        
        
        // To support a linked paywall, we add a "paywallRaiseHandler" - if a paywall is defined in the Nami control center as linked instead of Nami created, the Nami SDK will call this method to ask you to build and present the paywall UI, passing in paywall metadata defined in the control center.
        NamiPaywallManager.registerPaywallRaiseHandler { fromVC, skus, developerPaywallID, namiPaywall in
            if let raisingVC = fromVC {

                // For this demo app we have two custom paywalls it's possible to raise, so we check the developerPaywallID to see which one we should load and present.
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if developerPaywallID == "BasicLinkedPaywall" {
                    if let paywallVC = storyboard.instantiateViewController(withIdentifier: "SimplePaywallViewController") as? SimplePaywallViewController {

                        // Hand over the paywall metadata and objects from Nami to the paywall we are building.  The metadata includes things like paywall title, body and style data defined in the Nami control center.
                        paywallVC.products = skus
                        paywallVC.namiPaywall = namiPaywall
                        raisingVC.present(paywallVC, animated: true) {
                        }
                    }
                } else if developerPaywallID == "AlternateLinkedPaywall" {
                    if let paywallVC = storyboard.instantiateViewController(withIdentifier: "CollectionViewPaywallViewController") as? CollectionViewPaywallViewController {
                        
                        // Same as above case, hand over paywall metadata for application to use in building our custom paywall UI - in this case using a UICollectionView to present the product cells.
                        paywallVC.products = skus
                        paywallVC.namiPaywall = namiPaywall
                        raisingVC.present(paywallVC, animated: true) {
                        }
                    }
                } else {
                    print("Warning, paywall with unknown ID \(developerPaywallID) attempting to raise, abandoning.")
                }
            } else {
                print("No presenting view controller passed in, paywall not raised.")
            }
        }
        
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Start up Nami and set up paywall management
        namiSetup()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}
