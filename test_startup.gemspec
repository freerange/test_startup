# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{test_startup}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["James Adam"]
  s.date = %q{2009-07-23}
  s.email = %q{james@lazyatom.com}
  s.extra_rdoc_files = ["README.markdown"]
  s.files = ["README.markdown", "test/test_startup_test.rb", "lib/test_startup.rb"]
  s.homepage = %q{http://lazyatom.com}
  s.rdoc_options = ["--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{test_startup}
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{Adds Ruby 1.9-style startup and shutdown mechanisms to test/unit (or shoulda)}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
