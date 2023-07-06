# -*- encoding: utf-8 -*-
# stub: google-cloud-bigtable-v2 0.11.0 ruby lib

Gem::Specification.new do |s|
  s.name = "google-cloud-bigtable-v2".freeze
  s.version = "0.11.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Google LLC".freeze]
  s.date = "2023-06-06"
  s.description = "Cloud Bigtable is a fully managed, scalable NoSQL database service for large analytical and operational workloads. Note that google-cloud-bigtable-v2 is a version-specific client library. For most uses, we recommend installing the main client library google-cloud-bigtable instead. See the readme for more details.".freeze
  s.email = "googleapis-packages@google.com".freeze
  s.homepage = "https://github.com/googleapis/google-cloud-ruby".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6".freeze)
  s.rubygems_version = "3.3.15".freeze
  s.summary = "API for reading and writing the contents of Bigtables associated with a cloud project.".freeze

  s.installed_by_version = "3.3.15" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<gapic-common>.freeze, [">= 0.19.1", "< 2.a"])
    s.add_runtime_dependency(%q<google-cloud-errors>.freeze, ["~> 1.0"])
    s.add_development_dependency(%q<google-style>.freeze, ["~> 1.26.3"])
    s.add_development_dependency(%q<minitest>.freeze, ["~> 5.16"])
    s.add_development_dependency(%q<minitest-focus>.freeze, ["~> 1.1"])
    s.add_development_dependency(%q<minitest-rg>.freeze, ["~> 5.2"])
    s.add_development_dependency(%q<rake>.freeze, [">= 13.0"])
    s.add_development_dependency(%q<redcarpet>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.18"])
    s.add_development_dependency(%q<yard>.freeze, ["~> 0.9"])
  else
    s.add_dependency(%q<gapic-common>.freeze, [">= 0.19.1", "< 2.a"])
    s.add_dependency(%q<google-cloud-errors>.freeze, ["~> 1.0"])
    s.add_dependency(%q<google-style>.freeze, ["~> 1.26.3"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.16"])
    s.add_dependency(%q<minitest-focus>.freeze, ["~> 1.1"])
    s.add_dependency(%q<minitest-rg>.freeze, ["~> 5.2"])
    s.add_dependency(%q<rake>.freeze, [">= 13.0"])
    s.add_dependency(%q<redcarpet>.freeze, ["~> 3.0"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.18"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.9"])
  end
end
