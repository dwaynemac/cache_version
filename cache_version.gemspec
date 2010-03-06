# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{cache_version}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dwayne Macgowan"]
  s.date = %q{2010-03-06}
  s.description = %q{Keep Models Cache versions}
  s.email = %q{dwaynemac@gmail.com}
  s.extra_rdoc_files = ["README.rdoc", "lib/cache_version.rb"]
  s.files = ["README.rdoc", "Rakefile", "lib/cache_version.rb", "Manifest", "cache_version.gemspec"]
  s.homepage = %q{http://github.com/dwaynemac/cache_version}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Cache_version", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{cache_version}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Keep Models Cache versions}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
