# -*- encoding: utf-8 -*-
# stub: grpc-google-iam-v1 1.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "grpc-google-iam-v1".freeze
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Google LLC".freeze]
  s.date = "2022-08-17"
  s.description = "Common protos and gRPC services for Google IAM".freeze
  s.email = ["googleapis-packages@google.com".freeze]
  s.homepage = "https://github.com/googleapis/common-protos-ruby".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6".freeze)
  s.rubygems_version = "3.3.15".freeze
  s.summary = "Common protos and gRPC services for Google IAM".freeze

  s.installed_by_version = "3.3.15" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<googleapis-common-protos>.freeze, [">= 1.3.12", "< 2.0"])
    s.add_runtime_dependency(%q<google-protobuf>.freeze, ["~> 3.14"])
    s.add_runtime_dependency(%q<grpc>.freeze, ["~> 1.27"])
  else
    s.add_dependency(%q<googleapis-common-protos>.freeze, [">= 1.3.12", "< 2.0"])
    s.add_dependency(%q<google-protobuf>.freeze, ["~> 3.14"])
    s.add_dependency(%q<grpc>.freeze, ["~> 1.27"])
  end
end
