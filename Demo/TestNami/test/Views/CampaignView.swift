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
        paywallActionHandler: { campaignId, campaignName, campaignType, campaignLabel, campaignUrl, paywallId, paywallName, segmentId, externalSegmentId, paywallLaunchContext, action, skuId, purchaseError, purchases, deeplinkUrl in

            switch action {
            case .show_paywall:
                print("Launched campaign \(String(describing: campaignId)) - paywall raised \(String(describing: paywallId))")

            case .close_paywall:
                print("Launched campaign \(String(describing: campaignId)) - paywall closed \(String(describing: paywallId))")

            case .restore_purchases:
                print("Launched campaign \(String(describing: campaignId)) - paywall restore purchases tapped \(String(describing: paywallId))")

            case .sign_in:
                print("Launched campaign \(String(describing: campaignId)) - paywall sign in tapped \(String(describing: paywallId))")

            case .buy_sku:
                print("Launched campaign \(String(describing: campaignId)) - buy sku tapped with sku \(String(describing: skuId)) on paywall \(paywallId)")

            case .select_sku:
                print("Launched campaign \(String(describing: campaignId)) - sku \(String(describing: skuId)) selected on paywall \(String(describing: paywallId))")

            case .purchase_selected_sku:
                print("Launched campaign \(String(describing: campaignId)) - purchase flow started for sku \(String(describing: skuId)) on paywall \(String(describing: paywallId))")

            case .purchase_success:
                print("Launched campaign \(String(describing: campaignId)) - purchase success for sku \(String(describing: skuId)) on paywall \(String(describing: paywallId))")

            case .purchase_cancelled:
                print("Launched campaign \(String(describing: campaignId)) - purchase cancelled for sku \(String(describing: skuId)) on paywall \(String(describing: paywallId))")

            case .purchase_failed:
                print("Launched campaign \(String(describing: campaignId)) - purchase failed for sku \(String(describing: skuId)) on paywall \(paywallId) with error \(String(describing: purchaseError))")

            default:
                print("Launched campaign \(String(describing: campaignId)) - unknown action on paywall \(String(describing: paywallId))")
            }
        })
    }
}

struct CampaignView_Previews: PreviewProvider {
    static var previews: some View {
        CampaignView()
    }
}
