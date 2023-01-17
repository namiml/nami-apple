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
            List {
                Section(header: Text("Basic")) {
                    Button(action: launchDefault) {
                        Text("Default Campaign")
                    }
                }

                Section(header: Text("Templates")) {

                    Group {

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
                        Button(action: launchVenice) {
                            Text("Venice")
                        }
                    }

                    Group {
                        Button(action: launchMantis) {
                            Text("Mantis")
                        }
                        Button(action: launchCatalina) {
                            Text("Catalina")
                        }
                        Button(action: launchHonest) {
                            Text("Honest")
                        }
                        Button(action: launchOyster) {
                            Text("Oyster")
                        }
                        Button(action: launchCoral) {
                            Text("Coral")
                        }
                        Button(action: launchSimple) {
                            Text("Simple")
                        }
                        Button(action: launchPuffin) {
                            Text("Puffin")
                        }

                    }

                }

                Section(header: Text("Branded")) {
                    Button(action: launchHER) {
                        Text("HER V1")
                    }
                    Button(action: launchHERV2) {
                        Text("HER V2 - Carousel")
                    }
                    Button(action: launchHERV3) {
                        Text("HER V3 - Dark Mode")
                    }

//                    Button(action: launchPureVPN) {
//                        Text("PureVPN")
//                    }
//                    Text("Wondery")
                }


                Section(header: Text("Other")) {
                    Button(action: launchClassicPaywall) {
                        Text("Classic Paywall")
                    }
                }

            }
        }
        .navigationBarTitle("Campaigns")

    }

    private func launchDefault() {
        NamiCampaignManager.launch(launchHandler: { success, error -> () in
            print("campaign launch - success \(success) or error \(error)")
        })
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
    private func launchHonest() {
        launchWithLabel(label: "honest")
    }
    private func launchOyster() {
        launchWithLabel(label: "oyster")
    }
    private func launchSimple() {
        launchWithLabel(label: "simple")
    }
    private func launchPuffin() {
        launchWithLabel(label: "puffin")
    }
    private func launchCoral() {
        launchWithLabel(label: "coral")
    }

    // Branded
    private func launchPureVPN() {
        launchWithLabel(label: "purevpn")
    }
    private func launchHER() {
        launchWithLabel(label: "her_v1")
    }

    private func launchHERV2() {
        launchWithLabel(label: "her_v2")
    }

    private func launchHERV3() {
        launchWithLabel(label: "dark_mode")
    }

    // Legacy
    private func launchClassicPaywall() {
        launchWithLabel(label: "classic")
    }
    private func launchLinkedPaywall() {
        launchWithLabel(label: "linked")
    }

    private func launchWithLabel(label: String) {
        NamiCampaignManager.launch(label: label, launchHandler: { success, error in
            print("campaign launch - success \(success) or error \(error)")
        },
        paywallActionHandler: { action, sku, purchases -> () in

            switch action {
            case .close_paywall:
                print("Launched paywall action - paywall closed")

            case .restore_purchases:
                print("Launched paywall action - restore purchases tapped")

            case .sign_in:
                print("Launched paywall action - sign in tapped")

            case .buy_sku:
                print("Launched paywall action - buy sku tapped with sku: \(String(describing: sku?.storeId))")

            case .select_sku:
                print("Launched paywall action - sku selected: \(String(describing: sku?.storeId))")

            case .purchase_selected_sku:
                print("Launched paywall action - purchase flow started with selected sku: \(String(describing: sku?.storeId))")

            case .purchase_success:
                print("Launched paywall action - purchase success with purchases \(String(describing: purchases))")


            default:
                print("Launched paywall action - unknown \(action.rawValue) skuId: \(sku?.storeId)")
            }
        })
    }
}

struct CampaignView_Previews: PreviewProvider {
    static var previews: some View {
        CampaignView()
    }
}
