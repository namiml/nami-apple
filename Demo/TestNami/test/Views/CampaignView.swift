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
                Section(header: Text("Live Labeled Campaigns")) {
                    ForEach(namiDataSource.campaigns.filter { $0.value != nil && $0.type == .label }) { campaign in
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
        paywallActionHandler: { campaignId, campaignName, campaignType, campaignLabel, campaignUrl, paywallId, paywallName, segmentId, externalSegmentId, paywallLaunchContext, action, skuId, _, _, deeplinkUrl in

            print("Launched campaign with metadata: \n" +
                "campaignId: \(String(describing: campaignId))\n" +
                "campaignName: \(String(describing: campaignName))\n" +
                "campaignType: \(String(describing: campaignType))\n" +
                "campaignLabel: \(String(describing: campaignLabel))\n" +
                "campaignUrl: \(String(describing: campaignUrl))\n" +
                "paywallId: \(String(describing: paywallId))\n" +
                "paywallName: \(String(describing: paywallName))\n" +
                "segmentId: \(String(describing: segmentId))\n" +
                "externalSegmentId: \(String(describing: externalSegmentId))\n" +
                "paywallLaunchContext: \(String(describing: paywallLaunchContext))\n" +
                "deeplinkUrl: \(String(describing: deeplinkUrl))\n")

            switch action {
            case .show_paywall:
                print("paywall raised")

            case .close_paywall:
                print("paywall closed")

            case .restore_purchases:
                print("paywall restore purchases tapped")

            case .sign_in:
                print("paywall sign in tapped")

            case .deeplink:
                print("deeplink tapped")

            case .buy_sku:
                print("buy sku tapped with sku \(String(describing: skuId))")

            case .select_sku:
                print("sku selected \(String(describing: skuId))")

            case .purchase_selected_sku:
                print("purchase flow started for sku \(String(describing: skuId))")

            case .purchase_success:
                print("purchase success for sku \(String(describing: skuId))")

            case .purchase_cancelled:
                print("purchase cancelled for sku \(String(describing: skuId))")

            case .purchase_failed:
                print("purchase failed for sku \(String(describing: skuId))")

            default:
                print("unknown action")
            }
        })
    }
}

struct CampaignView_Previews: PreviewProvider {
    static var previews: some View {
        CampaignView()
    }
}
