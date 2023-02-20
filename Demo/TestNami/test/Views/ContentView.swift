//
//  ContentView.swift
//  Test Nami
//
//  Copyright © 2022 Nami ML Inc.
//

import AuthenticationServices
import NamiApple
import SwiftUI

struct ContentView: View {
    @StateObject var namiDataSource: NamiDataSource = .init()

    var body: some View {
        ZStack {
            TabView {
                NavigationView {
                    CampaignView()
                        .environmentObject(namiDataSource)
                }
                .tabItem {
                    Label("Campaigns", systemImage: "target")
                    Text("Campaigns")
                }
                .navigationViewStyle(.stack)
                .ignoresSafeArea()

                NavigationView {
                    ProfileView()
                        .environmentObject(namiDataSource)
                }
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                    Text("Profile")
                }
                .edgesIgnoringSafeArea(.top)
                .navigationViewStyle(.stack)

                NavigationView {
                    EntitlementsView()
                        .environmentObject(namiDataSource)
                }
                .tabItem {
                    Label("Entitlements", systemImage: "star")
                    Text("Entitlements")
                }
                .edgesIgnoringSafeArea(.top)
                .navigationViewStyle(.stack)
            }
            .edgesIgnoringSafeArea(.top)
            .accentColor(Color("PrimaryBlue"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
