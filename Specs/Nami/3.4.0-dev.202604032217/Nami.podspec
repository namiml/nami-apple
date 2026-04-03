Pod::Spec.new do |s|
  s.name             = 'Nami'
  s.version          = '3.4.0-dev.202604032217'
  s.summary          = 'Nami Apple SDK for subscription monetization.'
  s.homepage         = 'https://www.nami.ml'
  s.license          = { :type => 'CUSTOM' }
  s.author           = { 'Team Nami' => 'hello@nami.ml' }
  s.ios.deployment_target = '15.0'
  s.tvos.deployment_target = '15.0'
  s.source           = { :http => "https://packages.namiml.com/NamiSDK/Apple/3.4.0-dev.202604032217/NamiApple.xcframework-3.4.0-dev.202604032217-cocoapods.zip" }
  s.ios.vendored_frameworks = 'NamiApple.xcframework-cocoapods/NamiApple.xcframework'
  s.tvos.vendored_frameworks = 'NamiApple.xcframework-cocoapods/NamiApple.xcframework'
  s.frameworks = 'UIKit', 'StoreKit'
end
