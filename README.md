![Nami SDK logo](https://cdn.namiml.com/brand/sdk/Nami-SDK@0.5x.png)

# Nami SDK [![Platform](http://img.shields.io/badge/platform-iOS%20%7C%20iPadOS-lightgrey.svg?style=flat)](https://developer.apple.com/resources/) [![Cocoapod](http://img.shields.io/cocoapods/v/Nami.svg?style=flat)](http://cocoapods.org/pods/Nami/) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## What is Nami?

Nami is on a mission to help you grow your app business using IAPs and subscriptions.
Go beyond basic StoreKit infrastructure and focus on results with:

* Growing library of smart paywall templates to choose from, implemented natively using UIKit and SwiftUI
* Paywall CMS so you can make change instantly, without submitting an app update
* Experimentation engine to run paywall A/B tests so you can improve your conversion rates
* Built-in IAP & subscription management and analytics, so you don't need another solution

Nami is simple adopt while giving you the tools you need to improve revenue. Our free tier is generous, and gives you everything you need to get started. [Sign up for a free account](https://app.namiml.com/join/)

Get started by heading over to our [quick start guide](https://docs.namiml.com/docs/nami-quickstart-guide)

## Getting the Nami Framework

### Requirements
- iOS 11+, iPadOS 13+

### Using SPM

1. In the Xcode menu select **File > Swift Packages > Add Package Dependency**.
2. Enter the URL https://github.com/namiml/NamiSDK-SwiftPackageManager into the box just below **Choose Package Manager**, and press the **Next** button.
3. Leave the default settings of **Up to Next Major** and current major version number, press **Next** button.
4. After making sure the correct application target is selected, click the **Finish** button.

### Using CocoaPods

Add the following line to your Podfile.  See the example in this repo `Podfile.example`.

```
pod "Nami", "3.0.0-rc.07"
```

Then run the command

```
pod install
```

### Add Manually
The Nami XCFramework is available via the Swift Package Manager or Cocoapods. You may also add the XCFramework manually to your project. If you are using Xcode 11, you need to use this option. Learn the details[here](https://docs.namiml.com/docs/xcode-11).

#### Note: Updating the Nami Framework Manually

When a new version of the Nami framework is released, just drag it over your old Nami framework in your application project directory - make sure to select "replace" instead of "merge".  After the framework has been copied over the old one, make sure to select "Clean Build Folder" in Xcode so it properly refreshes the binary from the framework.

## Configure the SDK

In your application delegate, the Nami SDK is configured and passed your unique app ID,
You can find the Nami App Platform ID under the Nami Control Center's [Integrations > Apple App Store](https://app.namiml.com/integrations/) section.

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

  // Configure Nami
  let namiConfig = NamiConfiguration(appPlatformID: "YOUR_APP_PLATFORM_ID_GOES_HERE")

  // optionally adjust the level of logging of the SDK
  //    .debug, .info, .warn, .error, defaults to .warn
  namiConfig.logLevel = .info

  Nami.configure(namiConfig: namiConfig)
  return true
}
```

## Other Resources

### Release Notes
- [Stable](https://github.com/namiml/nami-apple/wiki/Nami-SDK-Stable-Releases)
- [Early Access](https://github.com/namiml/nami-apple/wiki/Nami-SDK-Early-Access-Releases)

### Documentation
- [Getting Started] (https://docs.namiml.com/docs/nami-quickstart-guide)
- [SDK Reference](https://docs.namiml.com/reference/)
