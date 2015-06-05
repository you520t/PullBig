Pod::Spec.new do |s|
  s.name         = "UIScrollView+PullBig"
  s.version      = "1.0.0"
  s.summary      = “pull big with ScrollView.”
  s.homepage     = "https://github.com/you520t/PullBig"
  s.license      = 'MIT'
  s.author       = { “Chenyu Liao” => “you520t@163.com" }
  s.platform     = :ios, "7.0"
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/you520t/PullBig.git", :tag => s.version}
  s.source_files  = 'pullWithBig/Classes/*.{h,m}'
  s.requires_arc = true
end
