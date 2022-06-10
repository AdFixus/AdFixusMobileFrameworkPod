#
# Be sure to run `pod lib lint AdFixusMobileFramework.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AdFixusMobileFramework'
  s.version          = '1.0.0'
  s.summary          = 'AdFixus Mobile Framework. Mobile Ads, fully responsive.'
  s.description      = <<-DESC
    AdFixus Mobile Framework will revolutionize your mobile In-App advertising.
                       DESC

  s.homepage         = 'https://adfixus.com'
  #s.libraries = [ "z" ]
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wayneschwebel' => 'wayne.schwebel@adfixus.com' }
  s.source           = { :http => 'https://github.com/AdFixus/AdFixusMobileFramework/raw/main/AdFixusMobileFramework-1.0.0.tar.gz' } #, :tag => s.version.to_s }
 # s.source           = { :git => 'https://github.com/adfixus/AdFixusMobileFramework.git' } #, :tag => s.version.to_s }
  #s.static_framework = true
  s.vendored_frameworks = ["Frameworks/AdFixusMobileFramework-current/AdFixusMobileFramework.xcframework"]
  s.platform = :ios
  s.ios.deployment_target = '9.0'

  #s.source_files = 'AdFixusMobileFramework.xcframework/**/*'
  
  # s.resource_bundles = {
  #   'AdFixusMobileFramework' => ['AdFixusMobileFramework/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
