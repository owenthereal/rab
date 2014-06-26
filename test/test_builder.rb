require "minitest/autorun"
require "tmpdir"
require "rab"

describe Rab::Builder do
  it "builds rails asset" do
    Dir.mktmpdir do |dir|
      rab = Rab::Builder.new("test/fixtures/bower_project", dir)
      rab.build!

      gemspec = File.read File.join(dir, "rails-assets-test-project.gemspec")
      gemspec.must_include "require 'rails-assets-test-project/version'"
      gemspec.must_include "RailsAssetsTestProject::VERSION"

      gemfile = File.read File.join(dir, "Gemfile")
      gemfile.must_include "source 'https://rails-assets.org'"

      rakefile = File.read File.join(dir, "Rakefile")
      rakefile.must_include "require \"bundler/gem_tasks\""

      lib_file = File.read File.join(dir, "lib", "rails-assets-test-project.rb")
      lib_file.must_include "require \"rails-assets-test-project/version\""
      lib_file.must_include "module RailsAssetsTestProject"

      version_file = File.read File.join(dir, "lib", "rails-assets-test-project", "version.rb")
      version_file.must_include "module RailsAssetsTestProject"
      version_file.must_include "VERSION = \"0.0.0\""

      js_path = File.join(dir, "vendor", "assets", "javascripts", "rails-assets-test-project")
      js_files = Dir.entries(js_path)
      js_files.must_include "bootstrap.js"
      js_files.must_include "foo.js"
      js_files.must_include "jquery.js"

      css_path = File.join(dir, "vendor", "assets", "stylesheets", "rails-assets-test-project")
      css_files = Dir.entries(css_path)
      css_files.must_include "bootstrap.css"
      css_files.must_include "foo.css"

      font_path = File.join(dir, "vendor", "assets", "fonts", "rails-assets-test-project")
      font_files = Dir.entries(font_path)
      font_files.must_include "glyphicons-halflings-regular.eot"
      font_files.must_include "glyphicons-halflings-regular.svg"
      font_files.must_include "glyphicons-halflings-regular.ttf"
      font_files.must_include "glyphicons-halflings-regular.woff"
    end
  end
end
