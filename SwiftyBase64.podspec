Pod::Spec.new do |s|
  s.name         = "SwiftyBase64"
  s.version      = "1.1.1"
  s.summary      = "base64 and base64url encoders in Swift"
  s.homepage     = "https://github.com/drichardson/SwiftyBase64"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Doug Richardson" => "dougie.richardson@gmail.com" }
  s.source       = { :git => "https://github.com/drichardson/SwiftyBase64.git", :tag => s.version }
  s.source_files = "SwiftyBase64"
  
  s.ios.deployment_target = "8.0"
  //s.watchos.deployment_target = "2.0"  watchos
  //s.tvos.deployment_target = "9.0"  tvos
  s.osx.deployment_target = "10.10" //if this code support osx 10.10.ues it
end
