

Pod::Spec.new do |s|

 
  s.name         = "HPWVisitorSDK"

  s.version      = "3.2.0"

  s.summary      = "HPWVistor for 智八哥"

  s.description  = "HPWVistorSDK for 智八哥访客端."

  s.homepage     = "http://www.71chat.com"

  s.license      = "MIT"
 
  s.author       = { "71sino" => "dev@71sino.com" }

  s.platform    = :ios, "8.0"
 
  s.source       = { :git => "https://github.com/71sino/ZBGVisitorSDK.git", :tag => s.version }

  s.source_files        = "Classes/**/*.{h,a}"
  s.exclude_files       = "Classes/*.md"
  s.vendored_libraries  = "Classes/**/*.a"
  s.public_header_files = "Classes/**/*.h"

  s.resources =  ['Classes/Resource/HappyWinBundle.bundle','Classes/Resource/LYTChatProgressHUD.bundle','Classes/Resource/HPWRefresh.bundle']

  s.libraries = "xml2.2", "z","sqlite3.0"
  s.dependency "LYMqttSDK", "~> 2.0.09"

end
