![Nami SDK logo](https://nami-brand.s3.amazonaws.com/images/Nami.SDK.2.0.120x137.png)

# Nami SDK [![Platform](http://img.shields.io/badge/platform-iOS%20%7C%20iPadOS-lightgrey.svg?style=flat)](https://developer.apple.com/resources/) [![Cocoapod](http://img.shields.io/cocoapods/v/Nami.svg?style=flat)](http://cocoapods.org/pods/Nami/) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## Why Nami?

Nami is on a mission to help app developers make more money by providing you tools to successfully sell your apps, not your users.

With Nami you can focus on your core app experience, not integrating and testing StoreKit and building in-app purchase or subscription offer screens. Our platform moves the critical elements to the cloud so you can make changes without making app updates.

## 1. Create your Nami account

[Get started now](https://app.namiml.com/join/) to create your free account.

## 2. Add your App to Nami

After creating your account, add your app to the [Nami Control Center](https://app.namiml.com).

[Watch a walkthrough video](https://vimeo.com/366322931) or read a [step-by-step guide](https://docs.namiml.com/docs/add-app) for adding your app.

## 3. Download the Nami Framework

Clone or download this repository!

### Requirements
- iOS 11+, iPadOS 13+
- **Built for Xcode 12, if you still use Xcode 11.3.1 use the framework located in Xcode11 folder and follow the "Add Manually" instructions below.**

## 4. Add the Nami Framework to your Xcode project

### Using CocoaPods

Add the following line to your Podfile.  See the example in this repo `Podfile.example`.

```
pod "Nami", "2.5.1"
```

Then run the command

```
pod install
```

### Using Carthage 

Temporarily removed Carthage support until XCFramework support is fully resolved.


### Add Manually
The XCFramework added via the Swift Package Manager and Cocoapods is built for Xcode 12.  If you are using Xcode 11.3.1, you'll need to add the Nami framework manually to your project - you can also use this technique in Xcode 12 if you wish.

For Xcode 11.3.1, you can download the version of the Nami framework in the "Xcode11" directory, in a file named Nami-xcode11_3_1.xcframework.zip.  Unzip that file after downloading to extract the framework and follow the instructions below.

For Xcode 11.6 and higher, you can just download the Nami.xcframework directory in the top level of the Nami GitHub repository.

After downloading the Nami framework from GitHub in the Nami repository, move to your application Project settings page in Xcode, and go to the General tab.  Scroll down until you can see the   "Frameworks and Libraries" section, and drag Nami.xcframework from the finder into this area.

A dialog will come up to verify, opt to "copy" the framework into the project so that your application has a copy of the framework to check into source control.

When complete, you can verify the Nami framework has been added properly by adding `import Nami` to the `AppDelegate.swift` file and then compiling your project.  If everything is configured properly, the app will build and link with the Nami library. If you receive errors, try cleaning the build folder or removing the Nami framework from your project and try re-adding it.

Make sure the option to "Embed and Sign" is chosen instead of just "Embed".

#### Note: Updating the Nami Framework Manually

When a new version of the Nami framework is released, just drag it over your old Nami framework in your application project directory - make sure to select "replace" instead of "merge".  After the framework has been copied over the old one, make sure to select "Clean Build Folder" in Xcode so it properly refreshes the binary from the framework.

## 5. Setup the Nami Framework in your App

In your application delegate, the Nami SDK is configured and passed your unique app ID,
You can find the Nami App ID under the Developer tab of the Nami Control Center's [App Settings](https://app.namiml.com/app-settings/) section.

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

  // Configure Nami
  Nami.shared.configure(appID: "YOUR_APP_ID_GOES_HERE")

  return true
}
```

It is recommended that you move the Nami setup code to its own method if you start adding other configuration calls (we'll cover these other possible calls later).  Also if you have existing code in the `didFinishLaunchingWithOptions` method, please call the Nami configure method as soon as possible to help the system initialize quickly and be ready for purchases.

Try building again to make sure all is well, then you are set up and ready to move to the next step.

## 6. Add Products

Add your App Store in-app purchase products to the Nami platform to use them from your cloud-based paywalls.

Products are managed from the [Nami Control Center > Products](https://app.namiml.com/products/)

[Watch a walkthrough video](https://vimeo.com/366345023) or read a [step-by-step guide](https://docs.namiml.com/docs/add-product) for adding products.

## 7. Add Your First Cloud-Controlled Paywall

The Nami framework supplies the views and view controllers you need to offer your products to your users. Since these Nami-powered screens are managed in the cloud, you can make changes without app updates.

Paywalls are managed from [Nami Control Center > Paywalls](https://app.namiml.com/paywalls/)

Learn more about [adding a paywall](https://docs.namiml.com/docs/add-paywall).

## 8. Create a Campaign

How and when you present paywalls to your users are governed by business rules specified in a campaign.

Campaigns are managed from [Nami Control Center > Campaigns](https://app.namiml.com/campaigns/)

Learn more about [creating a campaign](https://docs.namiml.com/docs/add-campaign).

Take your campaign live and you will see your paywall presented once business rule conditions are met.

## Next Steps: Dive Into Additional Functionality

For more details on using the SDK, check out our help documentation at [https://docs.namiml.com/](https://docs.namiml.com/).
