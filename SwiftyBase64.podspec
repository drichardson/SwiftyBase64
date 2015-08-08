Pod::Spec.new do |s|
  s.name         = "SwiftyBase64"
  s.version      = "0.9.2"
  s.summary      = "base64 and base64url encoders in Swift"
  s.homepage     = "https://github.com/drichardson/SwiftyBase64"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Doug Richardson" => "dougie.richardson@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/drichardson/SwiftyBase64.git", :tag => "0.9.2" }
  s.source_files = "SwiftyBase64"
end
