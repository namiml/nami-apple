//
//  MultiPaymentColor.swift
//  NamiColorsSWUI
//
//  Created by Kendall Gelner on 1/21/21.
//  Copyright © 2021 Nami ML Inc. All rights reserved.
//

import SwiftUI
import Nami

struct MultiPaymentColor: View {

    @EnvironmentObject var namiDataSource: NamiDataSource

    var body: some View {
        VStack(spacing: 30) {

            ColorChangingView()

            if namiDataSource.purchased {
                Text("This App Owned By Generous Tipper!")
                Button(action: {
                    // When the button is pressed we'll raise the application paywall.
                    NamiCampaignManager.launch(label: "swui_tip_paywall") { success, error in
                        print("Paywall could not be raised, error was \(String(describing: error?.localizedDescription)).")
                    }
                }) {
                    // Slightly more subtle text for re-tipping.
                    Text("Tip Again!")
                        .background(Color.white)
                        .foregroundColor(Color.purple)
                        .font(.body)
                        .padding()
                        .border(Color.purple, width: 1)
                }
            } else {
                Button(action: {
                    // When the button is pressed we'll raise the application paywall.
                    NamiCampaignManager.launch(label: "swui_tip_paywall") { success, error in
                        print("Paywall could not be raised, error was \(String(describing: error?.localizedDescription)).")
                    }
                }) {
                    // Button to tip the app owner on demand
                    Text("Tip App Owner!")
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
