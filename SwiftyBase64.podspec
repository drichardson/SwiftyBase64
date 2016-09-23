Pod::Spec.new do |s|
  s.name         = "SwiftyBase64"
  s.version      = "1.1.0"
  s.summary      = "base64 and base64url encoders in Swift"
  s.homepage     = "https://github.com/drichardson/SwiftyBase64"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Doug Richardson" => "dougie.richardson@gmail.com" }
  s.source       = { :git => "https://github.com/drichardson/SwiftyBase64.git", :tag => s.version }
  s.source_files = "SwiftyBase64"

  s.platform     = :ios, "8.0"
end
