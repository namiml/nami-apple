//
//  ContentView.swift
//  NamiColorsSWUI
//
//  Created by Kendall Gelner on 1/20/21.
//  Copyright © 2021 Nami ML Inc. All rights reserved.
//

import SwiftUI
import Nami


struct ResultView: View {
    var choice: String

    var body: some View {
        Text("You chose \(choice)")
    }
}

struct ContentView: View {

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
            Text("Choose type of purchase to demo:")
                .padding()
            
                NavigationLink(destination: SubscriptionColor()) {
                    Text("Subscription")
                }
                
                NavigationLink(destination: OneTimePaymentColor()) {
                    Text("One-Time Purchase")
                }
                
                NavigationLink(destination: MultiPaymentColor()) {
                    Text("Multi-Purchase (consumable)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


