require 'gosu'
require 'ruby/helper/resources/resource'

module Ruby
  module Helper
    module Resource
      AVAILABLE_IMAGE_EXTS = ['bmp', 'jpg', 'jpeg', 'png']

      def self.load(path)
        load_image path
      end

      def self.load_image(path)
        if is_valid_img_ext? path
          create_image path
        else
          nil
        end
      end

      private
        def self.is_valid_img_ext?(path)
          validate_ext(path, AVAILABLE_IMAGE_EXTS)
        end

        def self.create_image(path)
          Gosu::Image.new path
        end
    end
  end
end
