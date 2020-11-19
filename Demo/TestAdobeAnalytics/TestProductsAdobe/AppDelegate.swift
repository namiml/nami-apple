//
//  AppDelegate.swift
//  TestProducts
//
//  Created by Kendall Gelner on 6/21/19.
//  Copyright © 2019 Nami ML, Inc. All rights reserved.
//

// An application that demonstrates some common uses of the Nami API.

import UIKit
import Nami
import ACPCore
import ACPAnalytics
import ACPUserProfile

// For Nami, we comment out this line and add our own application main in main.swift.
@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func namiSetup() {
        // Makes sure when the app is re-run that any stored bypass purchases are cleared out so we can retry purchases
        // Notes this cannot clear out StoreKit sandbox or regular purchaes, which Apple controls.
        // This only clears out purchases made when bypassStoreKit is enabled.
        NamiPurchaseManager.clearBypassStorePurchases()

        // This is the appID for a Nami test application with already configured products and paywalls, contact Nami to obtain an Application ID for your own application.
        let namiConfig = NamiConfiguration(appPlatformID: "002e2c49-7f66-4d22-a05c-1dc9f2b7f2af")
        namiConfig.logLevel = .warn
        
        // For testing you can bypass StoreKit for purchases if you desire.
        // Xcode 12 and iOS 14 simualtors now support purchases, so we'll leave this off.
        namiConfig.bypassStore = false
        
        Nami.configure(namiConfig: namiConfig )
        
        NamiAnalyticsSupport.registerAnalyticsHandler { (actionType : NamiAnalyticsActionType, analyticsItems : [String:Any]) in

            // Look at the action type to determine what values to log.
            switch actionType {
            case .paywallRaise:
                var adobeData : [String:String] = [:]
                
                if let products = analyticsItems["paywallProducts"] as? [NamiSKU] {
                    let productList : String = products.reduce("", { (result, product) -> String in
                        if result.isEmpty {
                            return product.platformID
                        } else {
                            return result + "," + product.platformID
                        }
                    })
                    adobeData["paywall.products"] = productList
                }
                
                if let paywallName = analyticsItems[NamiAnalyticsKeys.paywallName] as? String {
                    adobeData["paywall.name"] = paywallName
                }
                if let paywallID = analyticsItems[NamiAnalyticsKeys.paywallID] as? String {
                    adobeData["paywall.uuid"] = paywallID
                }
                
                if let campaignName = analyticsItems[NamiAnalyticsKeys.campaignName] as? String {
                    adobeData["campaign.name"] = campaignName
                }
                if let campaignID = analyticsItems[NamiAnalyticsKeys.campaignID] as? String {
                    adobeData["campaign.uuid"] = campaignID
                }
                
                if let paywallType = analyticsItems[NamiAnalyticsKeys.paywallType] as? String {
                    adobeData["paywall.type"] = paywallType
                }
                
                if let namiTriggered = analyticsItems[NamiAnalyticsKeys.namiTriggered] as? String {
                    adobeData["nami.triggered"] = namiTriggered
                }
                
                ACPCore.trackState("PaywallView", data: adobeData)
                break;
            case .purchaseActivity:
                var purchaseData : [String:String] = [:]
                if let product = analyticsItems[NamiAnalyticsKeys.purchasedSKU_NamiSKU] as? NamiSKU {
                    purchaseData["purchase.product"] = product.platformID
                    if let regionCode = product.product?.priceLocale.regionCode {
                        purchaseData["purchase.locale"] = regionCode
                    }
                }
                if let purchasePrice = analyticsItems[NamiAnalyticsKeys.purchasedSKUPrice] as? Double {
                    purchaseData["purchase.price"] = "\(purchasePrice)"
                }
                
                ACPCore.trackAction("PaywallPurchase", data: purchaseData)
                break;
            @unknown default:
                break;
            }
        }
        
    }
    
    func adobeSetup() {
        ACPCore.setLogLevel(.debug)
        ACPCore.configure(withAppId: "")
   
        ACPAnalytics.registerExtension()
        ACPUserProfile.registerExtension()
        ACPIdentity.registerExtension()
        ACPLifecycle.registerExtension()
        ACPSignal.registerExtension()
        ACPCore.start {
            ACPCore.lifecycleStart(nil)
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // It's usually better to wrap setup code into separate functions in this way to keep the main didFinishLaunching cleaner.
        namiSetup()
        adobeSetup()

        return true
    }
}

