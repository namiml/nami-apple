//
//  AppDelegate.swift
//  TestProducts
//
//  Created by Kendall Gelner on 6/21/19.
//  Copyright © 2019-2021 Nami ML Inc. All rights reserved.
//

// An application that demonstrates some common uses of the Nami API.

import UIKit
import Nami

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func namiSetup() {
        // Makes sure when the app is re-run that any stored bypass purchases are cleared out so we can retry purchases
        // Note this cannot clear out StoreKit sandbox or regular purchaes, which Apple controls.
        // This only clears out purchases made when bypassStoreKit is enabled, or simulator purchases.
        // NamiPurchaseManager.clearBypassStorePurchases()
        
        // This is the appID for a Nami test application with already configured products and paywalls, contact Nami to obtain an Application ID for your own application.
        let namiConfig = NamiConfiguration(appPlatformID: "002e2c49-7f66-4d22-a05c-1dc9f2b7f2af")
        
        namiConfig.logLevel = .warn

        // For testing you can bypass StoreKit for purchases if you desire.
        // Xcode 12 and iOS 14 simualtors now support purchases, so we'll leave this off.
        namiConfig.bypassStore = false
        
        Nami.configure(namiConfig: namiConfig )
                
        NamiPaywallManager.registerSignInHandler { (fromVC, developerPaywallID, paywallMetadata) in
            // Present any sign in UI from here to validate the user has an account already in your system.
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        //There are a number of different options for configuring Nami in different ways, we recommend wrapping all of them into a function to keep it out of the way.
        namiSetup()

        return true
    }
}
