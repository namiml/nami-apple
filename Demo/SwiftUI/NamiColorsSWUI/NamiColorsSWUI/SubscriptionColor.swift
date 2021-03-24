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
                    NamiPaywallManager.preparePaywallForDisplay( developerPaywallID: "swui_subscription", backgroundImageRequired: true ) { (success, error) in
                        if success {
                            NamiPaywallManager.raisePaywall(developerPaywallID: "swui_subscription", fromVC: nil)
                        } else {
                            print("Paywall could not be raised, error was \(String(describing: error?.localizedDescription))")
                        }
                    }
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
                    NamiPaywallManager.preparePaywallForDisplay( developerPaywallID: "swui_subscription", backgroundImageRequired: true ) { (success, error) in
                        if success {
                            NamiPaywallManager.raisePaywall(developerPaywallID: "swui_subscription", fromVC: nil)
                        } else {
                            print("Paywall could not be raised, error was \(String(describing: error?.localizedDescription))")
                        }
                    }
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
