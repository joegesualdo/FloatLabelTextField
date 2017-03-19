Pod::Spec.new do |s|
  s.name             = 'FloatLabelTextField'
  s.version          = '1.0.2'
  s.summary          = 'Fancy TextFields with floating labels and error messages'
 
  s.description      = <<-DESC
Fancy TextFields with floating labels and error messages.
                       DESC
 
  s.homepage         = 'https://github.com/joegesualdo/FloatLabelTextField'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Joe Gesualdo' => 'joegesualdo@gmail.com' }
  s.source           = { :git => 'https://github.com/joegesualdo/FloatLabelTextField.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = 'FloatLabelTextField/FloatLabelTextField.swift'
end
