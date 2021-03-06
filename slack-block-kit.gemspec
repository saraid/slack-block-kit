lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "slack/block_kit/version"

Gem::Specification.new do |spec|
  spec.name          = "slack-block-kit"
  spec.version       = Slack::BlockKit::VERSION
  spec.authors       = ["Michael Chui"]
  spec.email         = ["saraid216@gmail.com"]

  spec.summary       = 'Slack BlockKit Helper'
  spec.homepage      = 'https://github.com/saraid/slack-block-kit'
  spec.licenses      = ['MIT']

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "simplecov", "~> 0.18"
end
