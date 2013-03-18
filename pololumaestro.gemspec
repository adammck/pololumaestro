Gem::Specification.new do |gem|
  gem.name          = "pololumaestro"
  gem.version       = "0.1"

  gem.authors       = ["Adam Mckaig"]
  gem.email         = ["adam.mckaig@gmail.com"]
  gem.summary       = %q{Ruby library to interact with the Pololu Maestro servo controller}
  gem.homepage      = "https://github.com/adammck/pololumaestro"

  gem.add_dependency "serialport"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
