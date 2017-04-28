Pod::Spec.new do |s|
  s.name             = "DParser"
  s.version          = "1.0.0"
  s.summary	         = "Parser json data to Object"
  s.homepage         = "https://github.com/yangyangyang121/DParser.git"
  s.license          = 'Code is MIT, then custom font licenses.'
  s.author           = { "daniel" => "yangyangyang121@163.com" }
  s.source           = { :git => "https://github.com/yangyangyang121/DParser.git", :tag => s.version }

  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes'

  s.frameworks = 'Foundation'
  s.module_name = 'DParser'

end

