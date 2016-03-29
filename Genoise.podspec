#
# Be sure to run `pod lib lint Genoise.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Genoise"
  s.version          = "1.0.1"
  s.summary          = "Genoise helps you to check if your app is outdated."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = "Genoise connects to iTunes API to retrieve and compare information and determine if your app is outdated."

  s.homepage         = "https://github.com/alariju/Genoise"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "alariju" => "albin.arias16@gmail.com" }
  s.source           = { :git => "https://github.com/alariju/Genoise.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/alariju'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'Genoise' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
