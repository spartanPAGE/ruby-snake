require 'gosu'
require 'ruby/helper/resources/resource'

module Ruby
  module Helper
    # Contains resource's loading
    module Resource
      AVAILABLE_IMAGE_EXTS = %w(bmp jpg jpeg png).freeze
      def self.load(path)
        load_image path
      end

      def self.load_image(path)
        create_image path if valid_img_ext? path
      end

      private_class_method def self.valid_img_ext?(path)
        validate_ext(path, AVAILABLE_IMAGE_EXTS)
      end

      private_class_method def self.create_image(path)
        Gosu::Image.new path
      end
    end
  end
end
