require "minitest/autorun"
require "rab"

describe Rab::Builder do
  it "builds rails asset" do
    skip
    rab = Rab::Builder.new("src", "dest")
    rab.build!
  end
end
