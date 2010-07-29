# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rack-amf}
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Stephen Augenstein"]
  s.date = %q{2010-07-29}
  s.email = %q{perl.programmer@gmail.com}
  s.files = ["README.rdoc", "Rakefile", "lib/rack/amf/environment.rb", "lib/rack/amf/middleware/pass_through.rb", "lib/rack/amf/middleware/service_manager.rb", "lib/rack/amf/middleware.rb", "lib/rack/amf.rb", "spec/service_manager_spec.rb", "spec/spec_helper.rb", "spec/spec.opts"]
  s.homepage = %q{http://github.com/warhammerkid/rack-amf}
  s.rdoc_options = ["--line-numbers", "--main", "README.rdoc", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{AMF gateway packaged as a rack middleware}
  s.test_files = ["spec/service_manager_spec.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<RocketAMF>, [">= 0.2.0"])
    else
      s.add_dependency(%q<RocketAMF>, [">= 0.2.0"])
    end
  else
    s.add_dependency(%q<RocketAMF>, [">= 0.2.0"])
  end
end
