//
//  TestApp.swift
//  Test Nami
//
//  Copyright © 2023 Nami ML Inc.
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
        var appPlatformId = "YOUR_PROD_APP_PLATFORM_ID"

        if BuildConfiguration.shared.environment == .staging {
            appPlatformId = "YOUR_STAGING_APP_PLATFORM_ID"
        }

        let namiConfig = NamiConfiguration(appPlatformId: appPlatformId)

        if BuildConfiguration.shared.environment == .staging {
            namiConfig.logLevel = .debug
        }
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
                        paywallActionHandler: { paywallEvent in

                            print("Campaign paywallActionHandler metadata: \n" +
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

                            switch paywallEvent.action {
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
                                print("buy sku tapped with sku \(String(describing: paywallEvent.sku?.skuId))")

                            case .select_sku:
                                print("sku selected \(String(describing: paywallEvent.sku?.skuId))")

                            case .purchase_selected_sku:
                                print("purchase flow started for sku \(String(describing: paywallEvent.sku?.skuId))")

                            case .purchase_success:
                                print("purchase success for sku \(String(describing: paywallEvent.sku?.skuId))")

                            case .purchase_cancelled:
                                print("purchase cancelled for sku \(String(describing: paywallEvent.sku?.skuId))")

                            case .purchase_failed:
                                print("purchase failed for sku \(String(describing: paywallEvent.sku?.skuId))")

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
