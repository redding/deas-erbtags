# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "deas-erbtags/version"

Gem::Specification.new do |gem|
  gem.name        = "deas-erbtags"
  gem.version     = Deas::ErbTags::VERSION
  gem.authors     = ["Kelly Redding", "Collin Redding"]
  gem.email       = ["kelly@kellyredding.com", "collin.redding@me.com"]
  gem.description = %q{Deas template helpers for creating HTML tags using Erb.}
  gem.summary     = %q{Deas template helpers for creating HTML tags using Erb.}
  gem.homepage    = "http://github.com/redding/deas-erbtags"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency("deas", ["~> 0.23"])

  gem.add_development_dependency("assert", ["~> 2.3"])

end
