
Pod::Spec.new do |s|

  s.name          = "AMXFontAutoScale"
  s.version       = "1.0.3"
  s.summary       = "Scale the font for UILabel and UITextView proportionally across all the screen sizes."

  s.description   = <<-DESC
                      Scale the font for UILabel and UITextView proportionally across all the screen sizes. Just define the screen size to be used as reference for scaling and the library will update all the instances of the UILabel and UITextView automatically.
                    DESC


  s.homepage              = "https://github.com/alexmx/AMXFontAutoScale"
  s.license               = "MIT"
  s.authors               = { "Alex Maimescu" => "maimescu.alex@gmail.com" }

  s.platform              = :ios
  s.ios.deployment_target = '8.0'

  s.pod_target_xcconfig   = { 'OTHER_LDFLAGS' => '-lObjC' }

  s.source                = { :git => "https://github.com/alexmx/AMXFontAutoScale.git", :tag => "v#{s.version}" }
  s.source_files          = "AMXFontAutoScale/**/*.{h,m,swift}"

end
