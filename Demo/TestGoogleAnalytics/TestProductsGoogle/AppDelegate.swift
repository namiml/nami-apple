//
//  AppDelegate.swift
//  TestProducts
//
//  Created by Kendall Gelner on 6/21/19.
//  Copyright © 2019 Nami ML, Inc. All rights reserved.
//

// An applciation that demonstrates some common uses of the Nami API.

import UIKit
import Nami
import Firebase

// For Nami, we comment out this line and add our own application main in main.swift.
//@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func namiSetup() {
        // For Internal use only, delete before pushing ot public repo.
        NamiCommand.performCommand("useStagingAPI")
        
        // For testing we'll bypass StoreKit, so you don't have to run the app on a device to test purchases.
        // You may want to include some ability to toggle this on for testers of your applcaition.
        NamiStoreKitHelper.shared.bypassStoreKit(bypass: true)
        
        // Makes sure when the app is re-run that any stored bypass purchases are cleared out so we can retry purchases
        // Notes this cannot clear out StoreKit sandbox or regular purchaes, which Apple controls.
        // This only clears out purchases made when bypassStoreKit is enabled.
        NamiStoreKitHelper.shared.clearBypassStoreKitPurchases()
        
        // This is the appID for a Nami test application with already configured products and paywalls, contact Nami to obtain an Application ID for your own application.
        Nami.shared.configure(appID: "2dc699a5-43c6-4e3a-9166-957e1640741b")
        
        NamiAnalyticsSupport.registerAnalyticsHandler { (actionType : NamiAnalyticsActionType, analyticsItems : [String:Any]) in

            // Look at the action type to determine what values to log.
            switch actionType {
            case .paywallRaise:
                var googleData : [String:String] = [:]
                
                if let products = analyticsItems["paywallProducts"] as? [NamiMetaProduct] {
                    let productList : String = products.reduce("", { (result, product) -> String in
                        if result.isEmpty {
                            return product.productIdentifier
                        } else {
                            return result + "," + product.productIdentifier
                        }
                    })
                    googleData["paywallProducts"] = productList
                }
                
                if let paywallName = analyticsItems[NamiAnalyticsKeys.paywallName] as? String {
                    googleData["paywallName"] = paywallName
                }
                if let paywallID = analyticsItems[NamiAnalyticsKeys.paywallID] as? String {
                    googleData["paywallUUID"] = paywallID
                }
                
                if let campaignName = analyticsItems[NamiAnalyticsKeys.campaignName] as? String {
                    googleData["campaignName"] = campaignName
                }
                if let campaignID = analyticsItems[NamiAnalyticsKeys.campaignID] as? String {
                    googleData["campaignUUID"] = campaignID
                }
                
                if let paywallType = analyticsItems[NamiAnalyticsKeys.paywallType] as? String {
                    googleData["paywallYype"] = paywallType
                }
                if let campaignType = analyticsItems[NamiAnalyticsKeys.campaignType] as? String {
                    googleData["campaignType"] = campaignType
                }
                
                if let namiTriggered = analyticsItems[NamiAnalyticsKeys.namiTriggered] as? String {
                    googleData["namiTriggered"] = namiTriggered
                }
                
                Analytics.logEvent("PaywallView", parameters: googleData)
                
            case .paywallClosed:
                break;
            case .paywallRaiseBlocked:
                break;
            case .purchaseActivity:
                var purchaseData : [String:String] = [:]
                if let product = analyticsItems[NamiAnalyticsKeys.purchasedProduct_NamiMetaProduct] as? NamiMetaProduct {
                    purchaseData["purchaseProduct"] = product.productIdentifier
                    if let regionCode = product.product.priceLocale.regionCode {
                        purchaseData["purchaseLocale"] = regionCode
                    }
                }
                if let purchasePrice = analyticsItems[NamiAnalyticsKeys.purchasedProductPrice] as? Double {
                    purchaseData["purchasePrice"] = "\(purchasePrice)"
                }
                
                Analytics.logEvent("Purchase", parameters: purchaseData)
            @unknown default:
                break;
            }
        }
    }
    
    func firebaseSetup() {
        // Note that you'll have to include your own GoogleServices info.plist file for this to work.
        FirebaseApp.configure()
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // It's usually better to wrap setup code into separate functions in this way to keep the main didFinishLaunching cleaner.
        namiSetup()
        firebaseSetup()

        return true
    }
}

