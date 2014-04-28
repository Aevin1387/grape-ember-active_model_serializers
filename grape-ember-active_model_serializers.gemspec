# -*- encoding: utf-8 -*-
require File.expand_path("../lib/grape-ember-active_model_serializers/version", __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Cory Stephenson"]
  gem.email         = ["aevin@me.com"]
  gem.summary       = %q(Use active_model_serializer in grape with support for Ember meta data in collections)
  gem.description   = %q(Extends grape-ember-active_model_serializers to include page data in a meta field for collections.)
  gem.homepage      = "https://github.com/aevin1387/grape-ember-active_model_serializers"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "grape-ember-active_model_serializers"
  gem.require_paths = ["lib"]
  gem.version       = Grape::Ember::ActiveModelSerializers::VERSION
  gem.licenses      = ["MIT"]

  gem.add_dependency "grape", "~> 0.7.0"
  gem.add_dependency "active_model_serializers", ">= 0.8.1"
  gem.add_dependency "grape-active_model_serializers", "~> 1.0.1"

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rack-test"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "guard-rspec"
end
