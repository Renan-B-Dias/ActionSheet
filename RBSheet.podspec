Pod::Spec.new do |s|
	s.name             = 'RBSheet'
	s.version          = '0.1.0'
	s.summary          =  'A simple way to show custom sheets'
	s.homepage         = 'https://github.com/renanbdias/RBSheet'
	s.license          = { :type => 'MIT', :file => 'LICENSE' }
	s.author           = { 'Renan B. Dias' => 'renanbenattidias@gmail.com' }
	s.source           = { :git => 'https://github.com/renanbdias/RBSheet.git', :tag => s.version.to_s }

	s.ios.deployment_target = '10.0'

	s.source_files = 'Source/**/*.swift'
end