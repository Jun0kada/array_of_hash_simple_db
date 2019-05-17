lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'array_of_hash_simple_db/version'

Gem::Specification.new do |spec|
  spec.name          = 'array_of_hash_simple_db'
  spec.version       = ArrayOfHashSimpleDb::VERSION
  spec.authors       = ['Jun0kada']
  spec.email         = ['jun.0kada.dev@gmail.com']

  spec.summary       = 'Array of Hash Simple DB'
  spec.description   = 'Array of Hash Simple DB'
  spec.homepage      = 'https://github.com/Jun0kada/array_of_hash_simple_db'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
