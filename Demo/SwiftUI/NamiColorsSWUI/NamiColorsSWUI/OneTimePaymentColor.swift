//
//  OneTimePaymentColor.swift
//  NamiColorsSWUI
//
//  Created by Kendall Gelner on 1/21/21.
//  Copyright © 2021 Nami ML Inc. All rights reserved.
//

import SwiftUI
import Nami

struct OneTimePaymentColor: View {
    
    @EnvironmentObject var namiDataSource: NamiDataSource

    var body: some View {
        VStack(spacing: 30) {

            ColorChangingView()

            if namiDataSource.purchased {
                ColorChangingView()               
            } else {
                Button(action: {
                    // When the button is pressed we'll raise the application paywall.
                    NamiPaywallManager.preparePaywallForDisplay( developerPaywallID: "swui_otp_paywall", backgroundImageRequired: true ) { (success, error) in
                        if success {
                            NamiPaywallManager.raisePaywall( developerPaywallID: "swui_otp_paywall", fromVC: nil)
                        } else {
                            print("Paywall could not be raised, error was \(String(describing: error?.localizedDescription))")
                        }
                    }
                }) {
                    Text("Buy extra Color Block!")
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
