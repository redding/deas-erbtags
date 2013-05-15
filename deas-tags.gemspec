# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "deas-tags/version"

Gem::Specification.new do |gem|
  gem.name        = "deas-tags"
  gem.version     = Deas::Tags::VERSION
  gem.authors     = ["Kelly Redding", "Collin Redding"]
  gem.email       = ["kelly@kellyredding.com", "collin.redding@me.com"]
  gem.description = %q{Deas template helpers for creating common HTML tags}
  gem.summary     = %q{Deas template helpers for creating common HTML tags}
  gem.homepage    = "http://github.com/redding/deas-tags"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency("assert")

end
