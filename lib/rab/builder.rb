module Rab
  class Builder
    attr_reader :src, :dst

    def initialize(src, dst)
      @src, @dst = src, dst
    end

    def build!
      prj = Bower::Project.import!(src)
      Gem::Packer.new(prj).pack!(dst)
    end
  end
end
