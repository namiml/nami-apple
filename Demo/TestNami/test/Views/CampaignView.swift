//
//  CampaignView.swift
//  Test Nami
//
//  Copyright © 2022 Nami ML Inc.
//

import SwiftUI
import NamiApple

struct CampaignView: View {
    @EnvironmentObject var namiDataSource: NamiDataSource

    var body: some View {

        ZStack {
            Form {
                Section(header: Text("Basic")) {
                    Button(action: launchDefault) {
                        Text("Default Campaign")
                    }
                }

                Section(header: Text("Templates")) {
                    Button(action: launchPenguin) {
                        Text("Penguin")
                    }
                    Button(action: launchPacific) {
                        Text("Pacific")
                    }
                    Button(action: launchTrident) {
                        Text("Trident")
                    }
                    Button(action: launchStarfish) {
                        Text("Starfish")
                    }
                    Button(action: launchMantis) {
                        Text("Mantis")
                    }
                    Button(action: launchVenice) {
                        Text("Venice")
                    }
                    Button(action: launchCatalina) {
                        Text("Catalina")
                    }
                }

                Section(header: Text("Other")) {
                    Button(action: launchClassicPaywall) {
                        Text("Classic Paywall")
                    }
                }

                Section(header: Text("Branded")) {
                    Button(action: launchPureVPN) {
                        Text("PureVPN")
                    }
                    Button(action: launchHER) {
                        Text("HER")
                    }
//                    Text("Wondery")
                }
            }
        }
        .navigationBarTitle("Campaigns")

    }

    private func launchDefault() {
        NamiCampaignManager.launch() { success, error -> () in
            print("campaign launch - success \(success) or error \(error)")
        }
    }
    // Templates
    private func launchPenguin() {
        launchWithLabel(label: "penguin")
    }
    private func launchPacific() {
        launchWithLabel(label: "pacific")
    }
    private func launchTrident() {
        launchWithLabel(label: "trident")
    }
    private func launchStarfish() {
        launchWithLabel(label: "starfish")
    }
    private func launchMantis() {
        launchWithLabel(label: "mantis")
    }
    private func launchVenice() {
        launchWithLabel(label: "venice")
    }
    private func launchCatalina() {
        launchWithLabel(label: "catalina")
    }


    // Branded
    private func launchPureVPN() {
        launchWithLabel(label: "purevpn")
    }
    private func launchHER() {
        launchWithLabel(label: "her")
    }

    // Legacy
    private func launchClassicPaywall() {
        launchWithLabel(label: "classic")
    }
    private func launchLinkedPaywall() {
        launchWithLabel(label: "linked")
    }

    private func launchWithLabel(label: String) {
        NamiCampaignManager.launch(label: label) { success, error in
            print("campaign launch - success \(success) or error \(error)")
        }
        paywallActionHandler: { action, skuId -> () in

            switch action {
            case .close_paywall:
                print("Launched paywall action - paywall closed")

            case .restore_purchases:
                print("Launched paywall action - restore purchases tapped")

            case .sign_in:
                print("Launched paywall action - sign in tapped")

            case .buy_sku:
                print("Launched paywall action - buy sku tapped with sku: \(String(describing: skuId))")

            case .select_sku:
                print("Launched paywall action - sku selected: \(String(describing: skuId))")

            case .purchase_selected_sku:
                print("Launched paywall action - purchase flow started with selected sku: \(String(describing: skuId))")


            default:
                print("Launched paywall action - unknown \(action.rawValue) skuId: \(skuId)")
            }


        }
    }
}

struct CampaignView_Previews: PreviewProvider {
    static var previews: some View {
        CampaignView()
    }
}
