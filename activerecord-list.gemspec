# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'active_record/list/version'

Gem::Specification.new do |s|

  # Description Meta...
  s.name        = 'activerecord-list'
  s.version     = ActiveRecord::List::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Michael"]
  s.email       = ['mmaccoffe@gmail.com']
  s.homepage    = 'http://github.com/mediaslave24/activerecord-list'
  s.summary     = %q{A gem allowing a active_record model to act as list.}

  # Load Paths...
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']


  # Dependencies (installed via 'bundle install')...
  s.add_dependency("activerecord", ["~> 3.2"])
  s.add_development_dependency("bundler", [">= 1.0.0"])
  s.add_development_dependency("rdoc")
  s.add_development_dependency("sqlite3")
end
