# -*- encoding: utf-8 -*-
require File.expand_path('../lib/malcom-rails3/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Sergi Hernando"]
  gem.email         = ["sergi.hernando@mobivery.com"]
  gem.description   = %q{Malcom integration library}
  gem.summary       = %q{Malcom integration library with push notifications API}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "malcom-rails3"
  gem.require_paths = ["lib"]
  gem.version       = Malcom::VERSION
end
