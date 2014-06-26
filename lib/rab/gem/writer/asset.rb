module Gem
  module Writter
    class Asset < Template
      protected

      def write_assets(dir, assets)
        asset_dir = File.join(dir, @project.dir_name)
        FileUtils.mkdir_p(asset_dir)
        assets.each { |a| FileUtils.cp a, File.join(asset_dir, File.basename(a)) }
      end
    end
  end
end
