# frozen_string_literal: true

require_relative "lib/string_toolkit/version"

Gem::Specification.new do |spec|
  spec.name = "string_toolkit"
  spec.version = StringToolkit::VERSION
  spec.authors = ["Shoaib Akram"]
  spec.email = ["shoaib.akram@maximustribe.com"]

  spec.summary = "A collection of handy string utility methods for Ruby."
  spec.description = "StringToolkit provides useful string manipulation methods like slugify, truncate_words, mask_email, title_case, and more."
  spec.homepage = "https://github.com/shoaibakram/string_toolkit"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
