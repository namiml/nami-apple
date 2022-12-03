//
//  ContentView.swift
//  Test Nami
//
//  Copyright © 2022 Nami ML Inc.
//

import SwiftUI
import NamiApple
import AuthenticationServices

struct ContentView: View {
    @StateObject var namiDataSource: NamiDataSource = NamiDataSource()

    var body: some View {
        ZStack {
            TabView {
                NavigationView {
                   CampaignView()
                        .environmentObject(namiDataSource)

                }
                .statusBar(hidden: true)
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
