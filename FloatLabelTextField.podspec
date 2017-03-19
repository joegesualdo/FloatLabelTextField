Pod::Spec.new do |s|
  s.name             = 'JPGInput'
  s.version          = '0.1.6'
  s.summary          = 'A fancy input'
 
  s.description      = <<-DESC
A fancy input.
                       DESC
 
  s.homepage         = 'https://github.com/joegesualdo/JPGInput-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Joe Gesualdo' => 'joegesualdo@gmail.com' }
  s.source           = { :git => 'https://github.com/joegesualdo/JPGInput-ios.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = 'JPGInput/JPGInputView.swift'
end
