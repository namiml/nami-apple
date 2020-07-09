#
# Be sure to run `pod lib lint nami.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Nami'
  s.version          = '2.1.1'
  s.summary          = 'Simplify StoreKit integration and testing. Add cloud based dynamic paywalls to your app.'

  s.description      = <<-DESC
This library helps manage StoreKit operations, allow cloud based controls of your paywall to change images, text, and products.  Adds cloud based control of rules for how your users see your paywall.

Requires an account with Nami ML.  Platform includes a free tier to get you up and running with subscriptions and paywalls in your app.

See https://nami.ml for more details and to request an account.
                       DESC

  s.homepage         = 'https://github.com/namiml/nami-apple'
  s.license          = { :type => 'CUSTOM', :file => 'LICENSE' }
  s.author           = { 'nami' => 'Kendall.Gelner@namiml.com' }
  s.source           = { :git => "https://github.com/namiml/nami-apple.git", :tag => "#{s.version}" }

  s.social_media_url = 'https://twitter.com/HelloNamiML'

  s.platform              = :ios, "11.0"
  s.ios.deployment_target = '11.0'

  s.ios.vendored_frameworks = 'Nami.xcframework'  
  s.frameworks = 'UIKit', 'StoreKit'
end
