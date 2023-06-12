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
        let context = PaywallLaunchContext(customAttributes: ["matchupImage": "https://imagecomposer.nfl.com/image/fetch/q_80,f_auto,h_2160,w_3840,c_fit/l_fetch:aHR0cHM6Ly9zdGF0aWMud3d3Lm5mbC5jb20vbGVhZ3VlL2FwcHMvc2hhcmVkL0NMRV9Bd2F5X1ZlcnRpY2FsLnBuZw==,h_2160,w_3840,c_fit,x_0/https:/static.www.nfl.com/league/apps/shared/BAL_Home_Vertical.png"])
        NamiCampaignManager.launch(label: label, context: context, launchHandler: { success, error in
            print("campaign launch - success \(success) or error \(String(describing: error))")
        },
        paywallActionHandler: { campaignId, _, paywallId, action, skuId, purchaseError, _ in

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
