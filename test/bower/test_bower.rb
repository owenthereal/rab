require "minitest/autorun"
require "rab"

describe Bower do
  it "creates bower project" do
    prj = Bower::Project.create!("test/fixtures/bower_project")
    prj.name.must_equal "test-project"
    prj.version.must_equal "0.0.0"
    prj.assets.size.must_equal 12
  end
end
