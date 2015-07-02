# -*- encoding: utf-8 -*-
# stub: baidu_push 3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "baidu_push"
  s.version = "1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["cinic2003"]
  s.date = "2015-07-02"
  s.description = "The ruby gem of baidu cloud push. Base on Baidu Push Rest API 3.0"
  s.email = ["cinic2003@gmail.com"]
  s.files = ["Gemfile", "Guardfile", "LICENSE.txt", "README.md", "Rakefile", "baidu_push.gemspec", "lib/baidu_push.rb", "lib/baidu_push/client.rb", "lib/baidu_push/request.rb", "lib/baidu_push/version.rb", "spec/baidu_push/client_spec.rb", "spec/baidu_push/request_spec.rb", "spec/spec_helper.rb"]
  s.homepage = "https://github.com/cinic2003/baidu_push.git"
  s.licenses = ["MIb"]
  s.rubygems_version = "2.4.7"
  s.summary = "The ruby gem of baidu cloud push. Base on Baidu Push Rest API 3.0"
  s.test_files = ["spec/baidu_push/client_spec.rb", "spec/baidu_push/request_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 1

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
