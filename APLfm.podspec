#
# Be sure to run `pod lib lint APLfm.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "APLfm"
  s.version          = "0.2.4"
  s.summary          = "A simple framework to facilitate working with the Last.fm API."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    A simple framework to facilitate working with the Last.fm API

    Request can be made either via the LastfmManager or via individual request. In the latter case, the AFHTTPSessionManager needs to be configured
    Common parameters like key, sessionToken, signature need not be sent in the request.
    So for a scroble request for example, the only mandatory parameters to be sent in the dictionary would be the artist and the track
                       DESC

  s.homepage         = "https://github.com/petrusalin/APLfm"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Alin Petrus" => "petrus.alin@gmail.com" }
  s.source           = { :git => "https://github.com/petrusalin/APLfm.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'APLfm/Classes/**/*'
  
  # s.resource_bundles = {
  #   'APLfm' => ['APLfm/Assets/*.png']
  # }

  #s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'AFNetworking', '~> 3.0'
  s.dependency 'CryptoSwift'

end
