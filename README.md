![Nami SDK logo](https://cdn.namiml.com/brand/sdk/Nami-SDK@0.5x.png)

# Nami SDK [![Platform](https://img.shields.io/badge/platform-iOS%20%7C%20iPadOS%20%7C%20tvOS-lightgrey.svg?style=flat)](https://developer.apple.com/resources/) [![Cocoapod](http://img.shields.io/cocoapods/v/Nami.svg?style=flat)](http://cocoapods.org/pods/Nami/) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## What is Nami?

Nami is on a mission to help you grow your Apple subscription business.

* Growing library of smart paywall templates to choose from, implemented natively using UIKit and SwiftUI
* No-code paywall and onboarding flow builder so you can design your pages from your browser
* Web-based CMS so you can make changes instantly, without submitting an app update
* Experimentation engine to run A/B tests so you can improve your conversion rates
* Optional: Built-in IAP & subscription management and analytics, so you don't need another solution

Nami is simple adopt while giving you the tools you need to improve revenue. Our free tier is generous, and gives you everything you need to get started. [Sign up for a free account](https://app.namiml.com/join/)

## Getting the Nami Framework

### Requirements
- iOS 15+, iPadOS 15+, tvOS 15+

### Using SPM

1. In the Xcode menu select **File > Swift Packages > Add Package Dependency**.
2. Enter the URL https://github.com/namiml/NamiSDK-SwiftPackageManager into the box just below **Choose Package Manager**, and press the **Next** button.
3. Leave the default settings of **Up to Next Major** and current major version number, press **Next** button.
4. After making sure the correct application target is selected, click the **Finish** button.

### Add Manually
The Nami XCFramework is available via the Swift Package Manager You may also add the XCFramework manually to your project.

#### Note: Updating the Nami Framework Manually

When a new version of the Nami framework is released, just drag it over your old Nami framework in your application project directory - make sure to select "replace" instead of "merge".  After the framework has been copied over the old one, make sure to select "Clean Build Folder" in Xcode so it properly refreshes the binary from the framework.
