//
//  CampaignView.swift
//  Test Nami
//
//  Copyright © 2022 Nami ML Inc.
//

import NamiApple
import SwiftUI

struct CampaignView: View {
    @EnvironmentObject var namiDataSource: NamiDataSource

    var body: some View {
        ZStack {
            Form {
                Section(header: Text("Live Unlabeled Campaign")) {
                    ForEach(namiDataSource.campaigns.filter { $0.type == .default }) { _ in
                        Button(action: launchDefault) {
                            Text("default")
                        }
                    }
                }
                Section(header: Text("Live Labeled Campaigns")) {
                    ForEach(namiDataSource.campaigns.filter { $0.value != nil }) { campaign in
                        Button(action: {
                            launchWithLabel(label: campaign.value!)
                        }) {
                            Text(campaign.value!)
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Campaigns")
        .toolbar {
            Button("Refresh") {
                NamiCampaignManager.refresh()
            }
        }
    }

    private func launchDefault() {
        NamiCampaignManager.launch(launchHandler: { success, error in
            print("campaign launch - success \(success) or error \(String(describing: error))")
        })
    }

    private func launchWithLabel(label: String) {
        NamiCampaignManager.launch(label: label, launchHandler: { success, error in
            print("campaign launch - success \(success) or error \(String(describing: error))")
        },
        paywallActionHandler: { action, skuId, purchaseError, _ in

            switch action {
            case .show_paywall:
                print("Launched paywall action - paywall raised")

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

            case .purchase_success:
                print("purchase success")

            case .purchase_cancelled:
                print("purchase cancelled")

            case .purchase_failed:
                print("purchase failed - error \(String(describing: purchaseError))")

            default:
                print("Launched paywall action - unknown \(action.rawValue) skuId: \(String(describing: skuId))")
            }
        })
    }
}

struct CampaignView_Previews: PreviewProvider {
    static var previews: some View {
        CampaignView()
    }
}
