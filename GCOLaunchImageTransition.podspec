#
# Be sure to run `pod spec lint GCOLaunchImageTransition.podspec' to ensure this is a
# valid spec.
#
Pod::Spec.new do |s|
  s.name         = "GCOLaunchImageTransition"
  s.version      = "0.0.1"
  s.summary      = "A short description of GCOLaunchImageTransition."
  # s.description  = <<-DESC
  #                   An optional longer description of GCOLaunchImageTransition
  #
  #                   * Markdown format.
  #                   * Don't worry about the indent, we strip it!
  #                  DESC
  s.homepage     = "http://gonecoding.com"
  s.license      = 'BSD'
  s.author       = { "Michael Sedlaczek" => "michael@gonecoding.com" }
  s.source       = { :git => "https://gonecoding.unfuddle.com:gonecoding/gcolaunchimagetransition.git", :tag => "0.1.0" }
  s.platform     = :ios, '5.0'
  s.ios.deployment_target = '5.0'
  s.source_files = 'GCOLaunchImageTransition/*.{h,m}'
  s.requires_arc = true
end
