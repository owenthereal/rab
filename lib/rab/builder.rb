module Rab
  class Builder
    attr_reader :src, :dst

    def initialize(src, dst)
      @src, @dst = src, dst
    end

    def build!
      prj = Bower::Project.create!(src)
      Gem::Packer.new(prj.assets).pack!(dst)
    end
  end
end
