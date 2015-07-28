Pod::Spec.new do |s|
  s.name             = "HaidoraValidation"
  s.version          = "0.1.0"
  s.summary          = "REValidation的扩展."
  s.description      = <<-DESC
                        REValidation对输入框添加验证.
                       DESC
  s.homepage         = "https://github.com/Haidora/HaidoraValidation"
  s.license          = 'MIT'
  s.author           = { "mrdaios" => "mrdaios@gmail.com" }
  s.source           = { :git => "https://github.com/Haidora/HaidoraValidation.git", :tag => s.version.to_s }
  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.frameworks = 'Foundation'
  s.dependency "REValidation"
end
