//
//  OneTimePaymentColor.swift
//  NamiColorsSWUI
//
//  Created by Kendall Gelner on 1/21/21.
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
                        // When the button is pressed we'll raise the applciation paywall.
                    NamiPaywallManager.raisePaywallForDeveloperID(developerPaywallID: "otp_paywall", fromVC: nil)

//                    NamiPaywallManager.raisePaywall(fromVC: nil)
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
