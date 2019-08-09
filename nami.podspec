#
# Be sure to run `pod lib lint nami.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'nami'
  s.version          = '1.3.0'
  s.summary          = 'Nami ML SDK, helps with StoreKit management/testing and definition of dynamic paywalls.'

  s.description      = <<-DESC
This library when installed and assigned an activated Nami account, helps manage StoreKit operations for you and provides the ability to build dynamic paywalls for your application along with rules around presentation of paywalls.

See https://nami.ml for more details and to request an account.
                       DESC

  s.homepage         = 'https://github.com/namiml/nami-ios'
  s.license          = { :type => 'CUSTOM', :file => 'LICENSE' }
  s.author           = { 'nami' => 'Kendall.Gelner@namiml.com' }
  s.source           = { :http => 'https://raw.githubusercontent.com/KiGi/nami-ios/master/Nami.framework.zip' }

#  Removed until Cocopods parses new Twitter correctly
#  s.social_media_url = 'https://twitter.com/HelloNamiML'

  s.platform              = :ios
  s.ios.deployment_target = '10.3'

  s.ios.vendored_frameworks = 'Nami.framework'  
  s.frameworks = 'UIKit', 'StoreKit'
end
