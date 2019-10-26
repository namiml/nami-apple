![Nami SDK logo](https://nami-brand.s3.amazonaws.com/images/Nami.SDK.RGB.Color.120x120.png)

# Nami SDK [![Platform](http://img.shields.io/badge/platform-iOS%20%7C%20iPadOS-lightgrey.svg?style=flat)](https://developer.apple.com/resources/) [![Cocoapod](http://img.shields.io/cocoapods/v/Nami.svg?style=flat)](http://cocoapods.org/pods/Nami/) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## Why Nami?

Nami is on a mission to help app developers make more money by providing you tools to successfully sell your apps, not your users.

With Nami you can focus on your core app experience, not integrating and testing StoreKit and building in-app purchase or subscription offer screens. Our platform moves the critical elements to the cloud so you can make changes without making app updates.

## 1. Create your Nami account

[Get started now](https://app.namiml.com/join/) to create your free account.

## 2. Add your App to Nami

After creating your account, add your app to the [Nami Control Center](https://app.namiml.com).

[Watch a walkthrough video](https://vimeo.com/366322931) or read a [step-by-step guide](http://help.namiml.com/en/articles/3412517-add-an-app) for adding your app.

## 3. Download the Nami Framework

Clone or download this repository!

### Requirements
- iOS 11+, iPadOS 13+
- **Built for Xcode 10.3, if you still use Xcode 10.2 use framework located in Xcode10-2 folder.**
- Now includes Xcode 11 build as well, look for Nami.xcframework in Xcode11 folder.

## 4. Add the Nami Framework to your Xcode project

### Using CocoaPods

Add the following line to your Podfile.  See the example in this repo `Podfile.example`.

```
pod "Nami", "1.7.0"
```

Then run the command

```
pod install
```

### Using Carthage 

Add the following line to your `Carthage` file.

```
github "namiml/nami-apple" ~> 1.7.0
```

Then run the following command.

```
carthage update
```

### Add Manually
After downloading the Nami framework from GitHub, move to your application Project settings page in Xcode, and go to the General tab.  Scroll down until you can see the Embedded Binaries section, and drag Nami.Framework form the finder into this area:

A dialog will come up to verify, opt to "copy" the framework into the project so that your application has  a copy of the framework to check into source control:

[](https://www.notion.so/b5df16527b064f38a921eaa3c75e77d4#1376cfc102c74ce0a8ef22aac7349a9c)

[](https://www.notion.so/b5df16527b064f38a921eaa3c75e77d4#981e9b4605c34d64a15140fc9aea410d)

When complete, you can verify the Nami framework has been added properly by adding `import Nami` to the `AppDelegate.swift` file and then compiling your project.  If everything is configured properly, the app will build and link with the Nami library. If you receive errors, try cleaning the build folder or removing the Nami framework from your project and try re-adding it.

#### Note: Xcode 11

For Xcode 11, you can copy the Nami.xcframework file into your project directory, then simply drag into the project "Frameworks and Libraries" section (General tab of project settings).

#### Note: Updating the Nami Framework

When a new version of the Nami framework is released, just drag it over your old Nami framework in your application project directory - make sure to select "replace" instead of "merge".  After the framework has been copied over the old one, make sure to select "Clean Build Folder" in Xcode so it properly refreshes the binary from the framework.

## 5. Setup the Nami Framework in your App

### a) Add Nami to Your Application Delegate

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

### b) Switch to NamiApplication

The Nami SDK provides a NamiApplication class, a subclass of UIApplicationMain.

NamiApplication allows Nami to do two things automatically:

1. Track metrics about app interactions that relate to your paid features
2. Monitor StoreKit callbacks, which are used for analytics and billing

### c) Comment Out UIApplicationMain

As Nami provides a custom UIApplication class, we'll need to disable the default UIApplicationMain code that is normally generated for you.

In your AppDelegate code, comment out the line that reads `@UIApplicationMain`. The Nami SDK provides a UIApplicationMain subclass that you will enable in the next step.

```swift
// @UIApplicationMain
```

### d) Add *main.swift* To Your Project

You’ll need to add a new file to your project with the name *main.swift,* then add this code:

```swift
import Foundation
import UIKit
import Nami

_ = Nami.shared

_ = UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, NSStringFromClass(NamiApplication.self), NSStringFromClass(AppDelegate.self))
```

### e) Add Run Script for Distribution

Note: This step is not required for Xcode 11 and later, only for Xcode 10.3 and 10.2 builds.

Lastly, because Nami is distributed as a Universal Framework, it contains binaries for both simulators and devices.  In order to submit app store or test flight builds, the simulator binaries need to be removed from the framework.  This requirement will go away with Xcode 11 which understands how to work with universal frameworks.

In order to do that, you need to create a new Run Script for your project that strips out unused binaries from frameworks.  Go to your application target in Xcode, then to the **Build Phases** tab, then hit the "+" symbol to add a new phase - choose **New Run Script Phase.**

[](https://www.notion.so/b5df16527b064f38a921eaa3c75e77d4#bf8d0e1b3d1f435da174a018501bb007)

Once in the run script, paste in the following script to clean frameworks of embedded binaries for platforms the app does not require (again, this script will be able to be removed as of Xcode 11 with a Nami XCFramework build).  If you use other third party libraries you may already have a similar script installed, if so you can just use what you have existing.

```shell
################################################################################
#
# Copyright 2015 Realm Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################

# This script strips all non-valid architectures from dynamic libraries in
# the application's `Frameworks` directory.
#
# The following environment variables are required:
#
# BUILT_PRODUCTS_DIR
# FRAMEWORKS_FOLDER_PATH
# VALID_ARCHS
# EXPANDED_CODE_SIGN_IDENTITY


# Signs a framework with the provided identity
code_sign() {
# Use the current code_sign_identitiy
echo "Code Signing $1 with Identity ${EXPANDED_CODE_SIGN_IDENTITY_NAME}"
echo "/usr/bin/codesign --force --sign ${EXPANDED_CODE_SIGN_IDENTITY} --preserve-metadata=identifier,entitlements $1"
/usr/bin/codesign --force --sign ${EXPANDED_CODE_SIGN_IDENTITY} --preserve-metadata=identifier,entitlements "$1"
}

echo "Stripping frameworks"
cd "${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}"

for file in $(find . -type f -perm +111); do
# Skip non-dynamic libraries
if ! [[ "$(file "$file")" == *"dynamically linked shared library"* ]]; then
continue
fi
# Get architectures for current file
archs="$(lipo -info "${file}" | rev | cut -d ':' -f1 | rev)"
stripped=""
for arch in $archs; do
if ! [[ "${VALID_ARCHS}" == *"$arch"* ]]; then
# Strip non-valid architectures in-place
lipo -remove "$arch" -output "$file" "$file" || exit 1
stripped="$stripped $arch"
fi
done
if [[ "$stripped" != "" ]]; then
echo "Stripped $file of architectures:$stripped"
if [ "${CODE_SIGNING_REQUIRED}" == "YES" ]; then
code_sign "${file}"
fi
fi
done
```
Try building again to make sure all is well, then you are set up and ready to move to the next step.

## 6. Add Products

Add your App Store in-app purchase products to the Nami platform to use them from your cloud-based paywalls.

Products are managed from the [Nami Control Center > Products](https://app.namiml.com/products/)

[Watch a walkthrough video](https://vimeo.com/366345023) or read a [step-by-step guide](https://help.namiml.com/en/articles/3109443-getting-started-with-products) for adding products.

## 7. Add Your First Cloud-Controlled Paywall

The Nami framework supplies the views and view controllers you need to offer your products to your users. Since these Nami-powered screens are managed in the cloud, you can make changes without app updates.

Paywalls are managed from [Nami Control Center > Paywalls](https://app.namiml.com/paywalls/)

Learn more about [adding a paywall](https://help.namiml.com/en/articles/3109428-getting-started-with-paywalls).

## 8. Create a Campaign

How and when you present paywalls to your users are governed by business rules specified in a campaign.

Campaigns are managed from [Nami Control Center > Campaigns](https://app.namiml.com/campaigns/)

Learn more about [creating a campaign](https://help.namiml.com/en/articles/3114737-getting-started-with-campaigns).

Take your campaign live and you will see your paywall presented once business rule conditions are met.

## Next Steps: Dive Into Additional Functionality

For more details on using the SDK, check out our help documentation at https://help.namiml.com/en/collections/1534886-nami-sdk-for-apple.
