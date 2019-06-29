## Requirements

- iOS 11+

## Get the code
Clone or download this repository!

For Xcode 11, you an use the Swift Package Manager to attach the framework to your project.

## Add the Nami Framework

After downloading the Nami framework from GitHub, move to your application Project settings page in Xcode, and go to the General tab.  Scroll down until you can see the Embedded Binaries section, and drag Nami.Framework form the finder into this area:

A dialog will come up to verify, opt to "copy" the framework into the project so that your application has  a copy of the framework to check into source control:

[](https://www.notion.so/b5df16527b064f38a921eaa3c75e77d4#1376cfc102c74ce0a8ef22aac7349a9c)

[](https://www.notion.so/b5df16527b064f38a921eaa3c75e77d4#981e9b4605c34d64a15140fc9aea410d)

When complete, you can verify the Nami framework has been added properly by adding `import Nami` to the `AppDelegate.swift` file and then compiling your project.  If everything is configured properly, the app will build and link with the Nami library. If you receive errors, try cleaning the build folder or removing the Nami framework from your project and try re-adding it.

## Setup Nami Code

With just a few steps you'll be up and running with Nami in your app.

### 1. Add Nami to Your Application Delegate

In your application delegate, the Nami SDK is configured and passed your unique app ID, which is embedded in the code snippet below.  You can also find the app ID on the App Settings screen in the General section under Nami App ID.

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

  // Configure Nami
  Nami.shared.configure(appID: "APP_ID")

  return true
}
```

It is recommended that you move the Nami setup code to its own method if you start adding other configuration calls (we'll cover these other possible calls later).  Also if you have existing code in the `didFinishLaunchingWithOptions` method, please call the Nami configure method as soon as possible to help the system initialize quickly and be ready for purchases.

### 2. Switch to NamiApplication

The Nami SDK provides a NamiApplication class, a subclass of UIApplicationMain.

NamiApplication allows Nami to do two things automatically:

1. Track metrics about key button and control interactions that relate to your paid features
2. Monitor StoreKit callbacks, which are used for paywall analytics and billing

### 3. Comment Out UIApplicationMain

As Nami provides a custom UIApplication class, we'll need to disable the default UIApplicationMain code that is normally generated for you.

In your AppDelegate code, comment out the line that reads `@UIApplicationMain`. The Nami SDK provides a UIApplicationMain subclass that you will enable in the next step.

```swift
// @UIApplicationMain
```

### 4. Add *main.swift* To Your Project

You’ll need to add a new file to your project with the name *main.swift,* then add this code:

```swift
import Foundation
import UIKit
import Nami

_ = Nami.shared

_ = UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, NSStringFromClass(NamiApplication.self), NSStringFromClass(AppDelegate.self))
```

### 5. Add Run Script for Distribution

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

Try building again to make sure all is well, then you are set up and ready to make use of Nami for working with paywalls and payments!

## Updating Nami Framework

When a new version of the Nami framework is released, just drag it over your old Nami framework in your application project directory - after it is copied in place, make sure to select "Clean Build Folder" in Xcode so it properly refreshes the binary from the framework.

## Advanced Functionality and Support

For more details on using the SDK, check out our help documentation at https://help.namiml.com/collections/1534886-nami-sdk-for-ios.
