
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "hanoi_tower/version"

Gem::Specification.new do |spec|
  spec.name          = "hanoi_tower"
  spec.version       = HanoiTower::VERSION
  spec.authors       = ["oieioi"]
  spec.email         = ["atsuinatsu.samuifuyu@gmail.com"]

  spec.summary       = %q{Solve Tower of hanoi on CLI}
  spec.description   = %q{Solve Tower of hanoi on CLI}
  spec.homepage      = "https://github.com/oieioi/hanoi_tower.rb"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
