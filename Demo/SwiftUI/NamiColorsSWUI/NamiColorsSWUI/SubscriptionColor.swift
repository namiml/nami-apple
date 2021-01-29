//
//  SubscriptionColor.swift
//  NamiColorsSWUI
//
//  Created by Kendall Gelner on 1/21/21.
//

import SwiftUI
import Nami

struct SubscriptionColor: View {    
    @EnvironmentObject var namiDataSource: NamiDataSource

    var body: some View {
        VStack(spacing: 30) {

            ColorChangingView()

            if namiDataSource.subscribed {
                ColorChangingView()
                Button(action: {
                    NamiPaywallManager.raisePaywallForDeveloperID(developerPaywallID: "subscription_paywall", fromVC: nil)
                }) {
                    Text("Manage Subscription")
                        .background(Color.white)
                        .foregroundColor(Color.purple)
                        .font(.body)
                        .padding()
                        .border(Color.purple, width: 1)
                }
            } else {
                Button(action: {
                    NamiPaywallManager.raisePaywallForDeveloperID(developerPaywallID: "subscription_paywall", fromVC: nil)
                }) {
                    Text("Subscribe for two colors!")
                        .background(Color.white)
                        .foregroundColor(Color.purple)
                        .font(.title)
                        .padding()
                        .border(Color.purple, width: 5)
                }
            }
        }
    }
}
