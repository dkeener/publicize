# -*- encoding: utf-8 -*-
require File.expand_path('../lib/publicize/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["diebels727","dkeener"]
  gem.email         = ["diebelsalternative@hotmail.com","dkeener@keenertech.com"]
  gem.description   = %q{Extends ActiveRecord to support features commonly needed by Rails-based web services.}
  gem.summary       = %q{The Publicize gem provides a domain-specific language (DSL) for exposing data in a RESTful manner via an API.}
  gem.homepage      = "https://github.com/dkeener/publicize"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "publicize"
  gem.require_paths = ["lib"]
  gem.version       = Publicize::VERSION
end
