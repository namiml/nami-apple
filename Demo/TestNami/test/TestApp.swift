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
