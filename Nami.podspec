#
# Be sure to run `pod lib lint nami.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Nami'
  s.version          = '3.0.20'
  s.summary          = 'Easy Apple StoreKit subscriptions & in-app purchases, with powerful built-in paywalls and A/B testing.'

  s.description      = <<-DESC
  This library helps you easily offer in-app purchases and subscriptions using Apple App Store billing and StoreKit APIs.

  - No IAP code to write.
  - Focus on your app experience.
  - All edge cases are handled and no server is required.
  - Includes is powerful built-in paywalls templates, built with SwiftUI and UIKit
  - Update paywalls easily using a browser-based paywall CMS.
  - Conduct paywall A/B tests, to improve your conversion rate.
  - Robust subscription analytics, webhooks, and much more.

Requires an account with Nami. The free tier is generous and includes everything you need to get up and running.

See https://www.namiml.com for more details and to create a free account.
                       DESC

  s.homepage         = 'https://github.com/namiml/nami-apple'
  s.license          = { :type => 'CUSTOM', :file => 'LICENSE' }
  s.author           = { 'Team Nami' => 'hello@namiml.com' }
  s.source           = { :git => "https://github.com/namiml/nami-apple.git", :tag => "#{s.version}" }

  s.social_media_url = 'https://twitter.com/HelloNamiML'

  s.ios.deployment_target = '14.0'
  s.tvos.deployment_target = '15.0'

  s.ios.vendored_frameworks = 'NamiApple.xcframework'
  s.tvos.vendored_frameworks = 'NamiApple.xcframework'
  s.frameworks = 'UIKit', 'StoreKit'
end
