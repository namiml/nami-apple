//
//  SubscriptionColor.swift
//  NamiColorsSWUI
//
//  Created by Kendall Gelner on 1/21/21.
//  Copyright © 2021 Nami ML Inc. All rights reserved.
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
                    NamiCampaignManager.launch(label: "swui_subscription") { success, error in
                        print("Paywall could not be raised, error was \(String(describing: error?.localizedDescription)).")
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
                    NamiCampaignManager.launch(label: "swui_subscription") { success, error in
                        print("Paywall could not be raised, error was \(String(describing: error?.localizedDescription)).")
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
