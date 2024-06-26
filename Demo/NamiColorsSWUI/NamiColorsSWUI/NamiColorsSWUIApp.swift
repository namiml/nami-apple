//
//  NamiColorsSWUIApp.swift
//  NamiColorsSWUI
//
//  Created by Kendall Gelner on 1/20/21.
//  Copyright © 2021 Nami ML Inc. All rights reserved.
//

import Nami
import SwiftUI

@main
struct NamiColorsSWUIApp: App {
    func setupNami() {
        let namiConfig = NamiConfiguration(appPlatformId: "002e2c49-7f66-4d22-a05c-1dc9f2b7f2af")
        namiConfig.logLevel = .debug
        Nami.configure(with: namiConfig)
    }

    init() {
        setupNami()
    }

    var namiDataSource = NamiDataSource()

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(namiDataSource)
        }
    }
}

/// This datasource is a publisher adaptor for subscription changes from the Nami SDK
class NamiDataSource: ObservableObject {
    /// This variable is modified my Nami depending on subscription status
    @Published var subscribed = false
    @Published var expirationDate: Date?

    @Published var purchased = false

    @Published var loggedIn = NamiCustomerManager.isLoggedIn()

    private var listener: NSObjectProtocol?

    init() {
        // On first init, check to see if subscription is active.
        subscribed = (NamiEntitlementManager.active().count > 0)

        // If you'd rather work with purchase, here's an alternative, though we always recommend working with entitlements when possible
        purchased = NamiPurchaseManager.allPurchases().count > 0

        // Now register a change handler that will set the variable when entitlements change.
        NamiEntitlementManager.registerActiveEntitlementsHandler { activeEntitlements in
            // If any entitlements exist we'll consider the subscription active, you could also look for specific entitlements here.
            self.subscribed = (activeEntitlements.count > 0)
            self.expirationDate = NamiPurchaseManager.allPurchases().first?.expires
        }

        NamiPurchaseManager.registerPurchasesChangedHandler { purchases, _, _ in
            self.purchased = (purchases.count > 0)
        }

        NamiCustomerManager.registerAccountStateHandler { accountStateAction, success, _ in
            if success {
                if accountStateAction == .login {
                    self.loggedIn = true
                } else {
                    self.loggedIn = false
                }
            }
        }
    }
}
