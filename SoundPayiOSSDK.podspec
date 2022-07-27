Pod::Spec.new do |s|
    s.platform              = :ios
    s.ios.deployment_target = '13.0'
    s.name                  = "SoundPayiOSSDK"
    s.summary               = "Data transfer over sound"
    s.requires_arc          = true
    
    
    s.version               = "1.0.0"
    
    s.license               = { :type => 'MIT', :file => 'LICENSE' }
    
    
    s.author                = { "AKSA-SDS" => "Naeem.hussain@axabiztech.com" }
    
    s.homepage              = "https://github.com/naeemhussainAksa/SoundPayiOSSDK.git"
    
    
    s.source                = {
    :git => "https://github.com/naeemhussainAksa/SoundPayiOSSDK.git",
    :branch => 'main',
    :tag => "#{s.version}"
    }

    s.source_files       = 'Resources/**/*.{h,m}' 
    s.source_files       = 'Resources/Sources/ggwave-iOS/**/*.{h, txt, mm}'
    s.source_files       = 'Resources/Sources/ggwave-iOS/include/ggwave/**/*.{h}'
    s.source_files       = 'Resources/Sources/ggwave-iOS/reed-solomon/**/*.{hpp}'

    
    s.swift_version      = "4.2"
    
end