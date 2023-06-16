//
//  TestApp.swift
//  Test Nami
//
//  Copyright © 2022 Nami ML Inc.
//

import NamiApple
import SwiftUI

@main
struct TestApp: App {
    init() {
        var initialNamiConfig: String?
        var initialConfigFileName = "nami_initial_config_prod"
        if BuildConfiguration.shared.environment == .staging {
            initialConfigFileName = "nami_initial_config_stg"
        }

        if let initialConfigPath = Bundle.main.url(forResource: initialConfigFileName, withExtension: "json") {
            if let string = try? String(contentsOf: initialConfigPath, encoding: String.Encoding.utf8) {
                initialNamiConfig = string
            }
        }

        print("Current configuration: \(BuildConfiguration.shared.environment)")
        // default to PROD
        var appPlatformId = "cae7b86c-dac1-42b6-80d2-765aaff766dc"

        if BuildConfiguration.shared.environment == .staging {
            appPlatformId = "111c1877-d660-4ad8-90f3-0b553e19e570"
        }

        let namiConfig = NamiConfiguration(appPlatformId: appPlatformId)

        if BuildConfiguration.shared.environment == .staging {
            namiConfig.namiCommands = ["useStagingAPI"]
        }
        namiConfig.logLevel = .debug
        // uses device locale by default. This is just for override
        //        namiConfig.namiLanguageCode = NamiLanguageCodes.ja

        if initialNamiConfig != nil {
            namiConfig.initialConfig = initialNamiConfig
        }

        Nami.configure(with: namiConfig)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    if NamiCampaignManager.isCampaignAvailable(url: url) {
                        print("Attempting campaign launch from deeplink \(url.absoluteString)")

                        NamiCampaignManager.launch(url: url, launchHandler: { success, error in
                            print("campaign launch from deeplink \(url.absoluteString) - success \(success) or error \(String(describing: error))")
                        },
                        paywallActionHandler: { campaignId, campaignName, campaignType, campaignLabel, campaignUrl, paywallId, paywallName, segmentId, externalSegmentId, paywallLaunchContext, action, skuId, _, _, deeplinkUrl in

                            print("Campaign paywallActionHandler metadata: \n" +
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
        }
    }
}

enum NamiEnvironment: String {
    case production
    case staging
}

class BuildConfiguration {
    static let shared = BuildConfiguration()

    var environment: NamiEnvironment

    init() {
        let currentConfiguration = Bundle.main.object(forInfoDictionaryKey: "NamiEnvironment") as! String

        environment = NamiEnvironment(rawValue: currentConfiguration)!
    }
}
