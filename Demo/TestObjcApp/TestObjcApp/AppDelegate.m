//
//  AppDelegate.m
//  TestObjcApp
//
//  Created by Kendall Gelner on 6/23/19.
//  Copyright © 2019-2021 Nami ML Inc. All rights reserved.
//

#import "AppDelegate.h"
//#import "Nami/Nami.h"
#import <Nami/Nami.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)shouldAllowPaywallRaise {
    return true;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    // This AppID is specific to Nami TestProducts applications.  You should contact
    // Nami to obtain an AppID you can use with your own appliciations.
    NamiConfiguration *namiConfig = [NamiConfiguration configurationForAppPlatformId: @"002e2c49-7f66-4d22-a05c-1dc9f2b7f2af"];
    [namiConfig setLogLevel:NamiLogLevelInfo];
    
   
        
    // If you activate this, you can simualte purchases in the simulator for testing, and on device
    // purchases will not go through the sandbox.
    [namiConfig setBypassStore:false];
    
    [Nami configureWith:namiConfig];
    
    [NamiMLManager coreActionWithLabel:@"Shared Item"];
    
    [NamiAnalyticsSupport registerHandlerWithHandler:^(enum NamiAnalyticsActionType actionType, NSDictionary<NSString *,id> * _Nonnull analyticsItems) {
        switch (actionType) {
            case NamiAnalyticsActionTypePaywallRaise:
                break;
            case NamiAnalyticsActionTypePurchaseActivity:
                break;
            default:
                break;
        }
    }];
    
    [NamiPaywallManager registerSignInHandler:^(UIViewController * _Nullable fromVC) {
        // If you opt to add a sign-in link to your paywall, this block would be called to present the UI for sign-in.
    }];
        
    
    [[NamiStoreKitHelper shared] registerWithPurchasesChangedHandler:^(NSArray<NamiPurchase *> * _Nonnull purchases, enum NamiPurchaseState purchaseState, NSError * _Nullable error) {
        // This block would react to any purchase changes, it will give you any purchases made or canceled.  Generallt you would check
        // the purchase state, if it is
        if (purchaseState == NamiPurchaseStatePurchased) {
            for (NamiPurchase *purchase in purchases) {
                NSString *productIdentifier = purchase.skuId;
                // Now do whatever you would like knowing this product has been purchased.
                // If it was a consumable produst, you should use it then call:
                // [[NamiStoreKitHelper shared] consumePurchasedProductWithProductID:productIdentifier];
            }
        }
    }];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
