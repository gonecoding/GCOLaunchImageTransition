#
# Be sure to run `pod spec lint GCOLaunchImageTransition.podspec' to ensure this is a
# valid spec.
#
Pod::Spec.new do |s|
  s.name         = "GCOLaunchImageTransition"
  s.version      = "0.1.0"
  s.summary      = "Yet another approach to animating the transition from launch image to app on iOS."
  s.description  = "Yet another approach to animating the transition from launch image to app on iOS. Includes customized animation delay and duration, triggering the transition via notification and display of an activity indicator."
  s.homepage     = "https://github.com/gonecoding/GCOLaunchImageTransition"
  s.license      = 'BSD'
  s.author       = { "Michael Sedlaczek" => "michael@gonecoding.com" }
  s.source       = { :git => "https://github.com/gonecoding/GCOLaunchImageTransition.git", :tag => "0.1.0" }
  s.platform     = :ios, '5.0'
  s.ios.deployment_target = '5.0'
  s.source_files = 'GCOLaunchImageTransition/*.{h,m}'
  s.requires_arc = true
end
