## Getting Started

This demo app shows how to use Adobe Analytics in tandem with the Nami SDK.

**Note that analytics integrations are only supported on paid enterprise plans for the Nami SDK.  Please visit www.nami.ml for more details.**

To get started

1. Close the project if it is already open in XCode.
2. `$ pod install`
3. `$ open TestProductsAdobe.xcworkspace`
4. In the file `AppDelegate.swift` find the function `adobeSetup()`. Add your `AppId` to this line of code `ACPCore.configure(withAppId: "")`.

*Note that this demo app uses Adobe Launch to deploy Adobe Analytics.  The `appId` expected is the `Environment File ID` that can be found in your Launch propetry under "Environments" and then "Install".*

![Adobe App ID](https://nami-public-web.s3.us-east-2.amazonaws.com/adobe_setup.png)

For more details on how to configure your analytics intergation, please see https://help.namiml.com/en/articles/3344401-analytics-integrations.
