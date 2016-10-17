require 'gosu'
require 'ruby/helper/resources/resource'

module Ruby
  module Helper
    # Contains resource's loading
    module Resource
      AVAILABLE_IMAGE_EXTS = %w(bmp jpg jpeg png).freeze
      AVAILABLE_SOUND_EXTS = %w(wav).freeze

      def self.load(path)
        return create_image path if valid_img_ext? path
        return create_sound path if valid_sound_ext? path
      end

      private_class_method def self.valid_img_ext?(path)
        validate_ext(path, AVAILABLE_IMAGE_EXTS)
      end

      private_class_method def self.valid_sound_ext?(path)
        validate_ext(path, AVAILABLE_SOUND_EXTS)
      end

      private_class_method def self.create_image(path)
        Gosu::Image.new path
      end

      private_class_method def self.create_sound(path)
        Gosu::Sample.new path
      end
    end
  end
end
