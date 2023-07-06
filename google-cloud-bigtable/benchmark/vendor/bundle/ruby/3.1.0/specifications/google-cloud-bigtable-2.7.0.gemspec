# -*- encoding: utf-8 -*-
# stub: google-cloud-bigtable 2.7.0 ruby lib

Gem::Specification.new do |s|
  s.name = "google-cloud-bigtable".freeze
  s.version = "2.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Google LLC".freeze]
  s.date = "2022-07-01"
  s.description = "google-cloud-bigtable is the official library for Cloud Bigtable API.".freeze
  s.email = "googleapis-packages@google.com".freeze
  s.homepage = "https://github.com/googleapis/google-cloud-ruby/tree/master/google-cloud-bigtable".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6".freeze)
  s.rubygems_version = "3.3.15".freeze
  s.summary = "API Client library for Cloud Bigtable API".freeze

  s.installed_by_version = "3.3.15" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<google-cloud-bigtable-admin-v2>.freeze, ["~> 0.0"])
    s.add_runtime_dependency(%q<google-cloud-bigtable-v2>.freeze, ["~> 0.0"])
    s.add_runtime_dependency(%q<google-cloud-core>.freeze, ["~> 1.5"])
    s.add_development_dependency(%q<google-style>.freeze, ["~> 1.26.1"])
    s.add_development_dependency(%q<minitest>.freeze, ["~> 5.16"])
    s.add_development_dependency(%q<minitest-focus>.freeze, ["~> 1.1"])
    s.add_development_dependency(%q<minitest-rg>.freeze, ["~> 5.2"])
    s.add_development_dependency(%q<redcarpet>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.9"])
    s.add_development_dependency(%q<yard>.freeze, ["~> 0.9"])
    s.add_development_dependency(%q<yard-doctest>.freeze, ["~> 0.1.13"])
  else
    s.add_dependency(%q<google-cloud-bigtable-admin-v2>.freeze, ["~> 0.0"])
    s.add_dependency(%q<google-cloud-bigtable-v2>.freeze, ["~> 0.0"])
    s.add_dependency(%q<google-cloud-core>.freeze, ["~> 1.5"])
    s.add_dependency(%q<google-style>.freeze, ["~> 1.26.1"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.16"])
    s.add_dependency(%q<minitest-focus>.freeze, ["~> 1.1"])
    s.add_dependency(%q<minitest-rg>.freeze, ["~> 5.2"])
    s.add_dependency(%q<redcarpet>.freeze, ["~> 3.0"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.9"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.9"])
    s.add_dependency(%q<yard-doctest>.freeze, ["~> 0.1.13"])
  end
end
