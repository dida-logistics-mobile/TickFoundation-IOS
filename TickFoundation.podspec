Pod::Spec.new do |s|
  s.name         = "TickFoundation"
  s.version      = "1.0.0"
  s.summary      = "TickFoundation"
  s.description  = "dida-logistics-mobile TickFoundation for ios"
                   
  s.homepage     = "https://github.com/dida-logistics-mobile"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "dida-logistics-mobile" => "976382156@qq.com" }

  #s.platform     = :ios
  s.platform     = :ios, "7.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/dida-logistics-mobile/TickFoundation-IOS.git", :tag => "#{s.version}" }
  s.source_files  = "TickFoundation/Classes/**/*"
  s.resources = "TickFoundation/Assets/*"
  s.requires_arc = true

  s.dependency 'AFNetworking'
  s.dependency 'JSONModel'
  s.dependency 'FMDB'
  s.dependency 'MBProgressHUD', '~>0.9'
  s.dependency 'YTKNetwork'
  s.dependency 'CocoaLumberjack'
  s.dependency 'MBProgressHUD', '~>0.9'
  s.dependency 'Masonry'
  s.dependency 'SDWebImage'
  s.dependency 'BaiduMobStat'
  s.dependency 'AliyunOSSiOS', '~> 2.6.0'

end
