# -*- encoding: utf-8 -*-
# stub: benchmark-ips 2.7.2 ruby lib

Gem::Specification.new do |s|
  s.name = "benchmark-ips".freeze
  s.version = "2.7.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Evan Phoenix".freeze]
  s.date = "2016-08-18"
  s.description = "An iterations per second enhancement to Benchmark.".freeze
  s.email = ["evan@phx.io".freeze]
  s.extra_rdoc_files = ["History.txt".freeze, "Manifest.txt".freeze, "README.md".freeze]
  s.files = ["History.txt".freeze, "Manifest.txt".freeze, "README.md".freeze]
  s.homepage = "https://github.com/evanphx/benchmark-ips".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--main".freeze, "README.md".freeze]
  s.rubygems_version = "2.6.14".freeze
  s.summary = "An iterations per second enhancement to Benchmark.".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.9"])
      s.add_development_dependency(%q<rdoc>.freeze, ["~> 4.0"])
      s.add_development_dependency(%q<hoe>.freeze, ["~> 3.15"])
    else
      s.add_dependency(%q<minitest>.freeze, ["~> 5.9"])
      s.add_dependency(%q<rdoc>.freeze, ["~> 4.0"])
      s.add_dependency(%q<hoe>.freeze, ["~> 3.15"])
    end
  else
    s.add_dependency(%q<minitest>.freeze, ["~> 5.9"])
    s.add_dependency(%q<rdoc>.freeze, ["~> 4.0"])
    s.add_dependency(%q<hoe>.freeze, ["~> 3.15"])
  end
end
