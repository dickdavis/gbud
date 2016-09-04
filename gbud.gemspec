# -*- encoding: utf-8 -*-'
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name          = 'gbud'
  s.version       = '0.0.3'
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Richard Davis']
  s.email         = 'dick@sbdsec.com'
  s.homepage      = 'http://www.github.com/d3d1rty/gbud'
  s.summary       = 'Initializes the basic structure of a gem'
  s.description   = <<-EOF
    This project aims to make starting a new gem project simple by automating
     the creation of all required files and directories for you.
  EOF
  s.license       = 'GPL-3.0'
  s.files         = Dir['lib/**/*.rb']
  s.executables   = ['gbud']
  s.test_files    = Dir['test/**/*.rb']
  s.require_path  = ['lib']
end
