# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "oa-blip/version"

Gem::Specification.new do |s|
  s.name        = "oa-blip"
  s.version     = Oa::Blip::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Michał Łomnicki", "Darek Gertych"]
  s.email       = ["michal.lomnicki@gmail.com", "dariusz.gertych@gmail.com"]
  s.homepage    = "https://github.com/mlomnicki/oa-blip"
  s.summary     = %q{OmniAuth strategy for blip.pl OAuth}
  s.description     = %q{OmniAuth strategy for blip.pl OAuth}

  s.rubyforge_project = "oa-blip"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency("oa-oauth")

  s.add_development_dependency  'mg',         '~> 0.0.8'
  s.add_development_dependency  'rspec',      '~> 2.4.0'
  s.add_development_dependency  'webmock',    '~> 1.3.4'
  s.add_development_dependency  'rack-test',  '~> 0.5.4'
  s.add_development_dependency  'json',       '~> 1.4.3'
end
