#
#  Be sure to run `pod spec lint AutoDisposable.podspec' to ensure this is a

Pod::Spec.new do |spec|

  spec.name         = "AutoDisposable"
  spec.version      = "1.0.1"
  spec.summary      = "RxSwift extensions for automatically disposing of observables."
  spec.homepage     = "vladislav.ternovskii@gmail.com"
  spec.description  = <<-DESC
  AutoDisposable is a tool for automatically binding the execution of RxSwift streams to a provided scope via disposal.
	DESC

  spec.homepage     = "https://github.com/BiohazardUA/AutoDisposable"

  spec.license      = { :type => "MIT", :file => "LICENSE" }


  spec.author             = { "Vladislav Ternovskiy" => "vladislav.ternovskii@gmail.com" }
  spec.social_media_url   = "https://www.linkedin.com/in/vladislav-ternovskiy-494995119"
  spec.source       = { :git => "https://github.com/BiohazardUA/AutoDisposable.git", :tag => spec.version.to_s }

  spec.ios.deployment_target = '8.0'
  spec.osx.deployment_target = '10.9'
  spec.watchos.deployment_target = '3.0'
  spec.tvos.deployment_target = '9.0'

  spec.requires_arc = true

  spec.source_files          = 'AutoDisposable/**/*.{swift,h,m}', 'Platform/**/*.swift'

  spec.dependency 'RxSwift', '~> 5'
  spec.dependency 'RxCocoa', '~> 5'
  spec.dependency 'RxRelay', '~> 5'

  spec.swift_version = '5.0'

end
