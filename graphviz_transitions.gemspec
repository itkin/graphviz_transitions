# coding: utf-8
$:.push File.expand_path('../lib', __FILE__)
require 'graphviz_transitions/version'

Gem::Specification.new do |spec|
  spec.name          = "graphviz_transitions"
  spec.version       = GraphvizTransitions::VERSION
  spec.authors       = ["Itkin"]
  # spec.email         = ["nicolas.papon@gmail.com"]
  spec.summary       = %q{Use Ruby-GraphViz for Transitions.}
  spec.description   = %q{This gem patches Transitions to be able to generate graphs using GraphViz.}
  # spec.homepage      = "https://github.com/romatr/graphviz_aasm"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_dependency "transitions"
  spec.add_dependency "ruby-graphviz"
end
