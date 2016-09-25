lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ciscospark-ruby/version"

Gem::Specification.new do |gem|
  gem.add_dependency "httparty"

  gem.add_development_dependency "bundler", "~> 1.0"

  gem.authors       = ["Chad Stachowicz"]
  gem.email         = ["cstachowicz@cloverhound.com"]
  gem.description   = "A REST API Toolkit for Cisco Spark"
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/cloverhound/ciscospark-ruby"
  gem.licenses      = %w(MIT)

  gem.executables   = `git ls-files -- bin/*`.split("\n").collect { |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "ciscospark-ruby"
  gem.require_paths = %w(lib)
  gem.version       = Ciscospark::VERSION
end
