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
        var initialNamiData: Data?
        if let initialConfigPath = Bundle.main.url(forResource: "nami_initial_config", withExtension: "json"),
           let data = try? Data(contentsOf: initialConfigPath)
        {
            initialNamiData = data
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
//            namiConfig.namiCommands = ["useStagingAPI", "overrideTemplateFileName=template.json"]
        }
        namiConfig.logLevel = .debug
//        namiConfig.namiLanguageCode = NamiLanguageCodes.ja

        if initialNamiData != nil {
            namiConfig.initialConfig = initialNamiData
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
