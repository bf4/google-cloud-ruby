# -*- encoding: utf-8 -*-
# stub: toys 0.14.5 ruby lib

Gem::Specification.new do |s|
  s.name = "toys".freeze
  s.version = "0.14.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/dazuma/toys/issues", "changelog_uri" => "https://dazuma.github.io/toys/gems/toys/v0.14.5/file.CHANGELOG.html", "documentation_uri" => "https://dazuma.github.io/toys/gems/toys/v0.14.5", "source_code_uri" => "https://github.com/dazuma/toys/tree/main/toys" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Daniel Azuma".freeze]
  s.date = "2023-03-20"
  s.description = "Toys is a configurable command line tool. Write commands in Ruby using a simple DSL, and Toys will provide the command line executable and take care of all the details such as argument parsing, online help, and error reporting. Toys is designed for software developers, IT professionals, and other power users who want to write and organize scripts to automate their workflows. It can also be used as a replacement for Rake, providing a more natural command line interface for your project's build tasks.".freeze
  s.email = ["dazuma@gmail.com".freeze]
  s.executables = ["toys".freeze]
  s.files = ["bin/toys".freeze]
  s.homepage = "https://github.com/dazuma/toys".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4.0".freeze)
  s.rubygems_version = "3.3.15".freeze
  s.summary = "A configurable command line tool".freeze

  s.installed_by_version = "3.3.15" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<toys-core>.freeze, ["= 0.14.5"])
  else
    s.add_dependency(%q<toys-core>.freeze, ["= 0.14.5"])
  end
end
