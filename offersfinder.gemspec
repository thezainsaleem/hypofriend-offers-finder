# frozen_string_literal: true

require_relative "lib/offersfinder/version"

Gem::Specification.new do |spec|
  spec.name          = "offersfinder"
  spec.version       = Offersfinder::VERSION
  spec.authors       = ["Zain Saleem"]
  spec.email         = ["thezainsaleem@gmail.com"]

  spec.summary       = "Finds New Offers from Hypofriend"
  spec.description   = "Based on passed in parameters, finds best new offers consuming new-offers API."
  spec.homepage      = "https://github.com/thezainsaleem/"
  spec.license       = "MIT"
  spec.required_ruby_version = "= 2.5"

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "None"
  spec.metadata["changelog_uri"] = "None"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "httparty", "0.20.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
