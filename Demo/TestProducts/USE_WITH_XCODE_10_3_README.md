![Nami SDK logo](https://nami-brand.s3.amazonaws.com/images/Nami.SDK.RGB.Color.120x120.png)

# Nami TestProducts Demo for iOS

A simple application to show how Nami is integrated with an application.

Note that for the demo to work properly, you need to use Xcode 10.3 to run the demo with the version of the Nami framework included with the demo - the framework versions are tied to a specific Xcode version until Xcode 11, which supports framework module portability.

The interesting Nami code showing typical use is located both in the namiSetup() method of AppDelegate, and spread throughout ViewController.swift.  The demo uses real SKProduct products loaded from the app store, though is set to bypass StoreKit for actual purchases.

See the code for more specific details in the comments or visit https://www.namiml.com to learn more about Nami.
