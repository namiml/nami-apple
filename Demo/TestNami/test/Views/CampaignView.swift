//
//  CampaignView.swift
//  Test Nami
//
//  Copyright © 2023 Nami ML Inc.
//

import NamiApple
import SwiftUI

struct CampaignView: View {
    @EnvironmentObject var namiDataSource: NamiDataSource
    @State var counter = 0
    @State private var showSheet = false
    @State var isPaywallHidden = NamiPaywallManager.isHidden()

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
        paywallActionHandler: { paywallEvent in

            switch paywallEvent.action {
            case .show_paywall:
                print("\nSHOW PAYWALL")

                print("Paywall Event data: \n" +
                    "campaignId: \(String(describing: paywallEvent.campaignId))\n" +
                    "campaignName: \(String(describing: paywallEvent.campaignName))\n" +
                    "campaignType: \(String(describing: paywallEvent.campaignType))\n" +
                    "campaignLabel: \(String(describing: paywallEvent.campaignLabel))\n" +
                    "campaignUrl: \(String(describing: paywallEvent.campaignUrl))\n" +
                    "paywallId: \(String(describing: paywallEvent.paywallId))\n" +
                    "paywallName: \(String(describing: paywallEvent.paywallName))\n" +
                    "segmentId: \(String(describing: paywallEvent.segmentId))\n" +
                    "externalSegmentId: \(String(describing: paywallEvent.externalSegmentId))\n" +
                    "paywallLaunchContext: \(String(describing: paywallEvent.paywallLaunchContext))\n" +
                    "deeplinkUrl: \(String(describing: paywallEvent.deeplinkUrl))\n")

            case .close_paywall:
                print("\nCLOSE PAYWALL")

            case .restore_purchases:
                print("\nRESTORE_PURCHASES")

            case .sign_in:
                print("\nSIGN_IN")

            case .deeplink:
                print("\nDEEPLINK")

            case .buy_sku:
                print("\nBUY SKU")
                print("sku: \(paywallEvent.sku?.skuId ?? "")")
                print("promo: \(paywallEvent.sku?.promoId ?? "")")

            case .select_sku:
                print("\nSELECT SKU with \(String(describing: paywallEvent.sku?.skuId))")

            case .purchase_selected_sku:
                print("\nPURCHASE SELECTED SKU with\(String(describing: paywallEvent.sku?.skuId))")

            case .purchase_success:
                print("\nPURCHASE SUCCESS for sku \(String(describing: paywallEvent.sku?.skuId))")

            case .purchase_cancelled:
                print("\nPURCHASE CANCELLED for sku \(String(describing: paywallEvent.sku?.skuId))")

            case .purchase_failed:
                print("\nPURCHASE FAILED for sku \(String(describing: paywallEvent.sku?.skuId))")

            case .toggle_change:
                print("\nTOGGLE CHANGE")
                print("id: \(String(describing: paywallEvent.componentChange?.id))")
                print("name: \(String(describing: paywallEvent.componentChange?.name))\n")

            case .slide_change:
                print("\nSLIDE CHANGE")
                print("id: \(String(describing: paywallEvent.componentChange?.id))")
                print("name: \(String(describing: paywallEvent.componentChange?.name))\n")

            case .page_change:
                print("\nPAGE CHANGE")
                print("id: \(String(describing: paywallEvent.componentChange?.id))")
                print("name: \(String(describing: paywallEvent.componentChange?.name))\n")

            default:
                print("UNKNOWN ACTION")
            }

        })
    }
}

struct CampaignView_Previews: PreviewProvider {
    static var previews: some View {
        CampaignView()
    }
}
