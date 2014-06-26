require "thor"
require "rab"

module Rab
  class CLI < Thor
    desc "build SRC DST", "Build Rails assets gem from bower folder SRC to destination folder DST"

    def build(src, dst)
      builder = Rab::Builder.new(src, dst)
      builder.build!
    end
  end
end
