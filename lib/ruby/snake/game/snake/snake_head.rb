require 'gosu'
require 'ruby/helper/resources/loader'
require 'ruby/snake/game/entity/angle_based_entity'

module Ruby
  module Snake
    # Snake head is an angle based entity,
    # that handles player input and draws itself
    class SnakeHead < Game::AngleBasedEntity
      def update
        handle_keyboard
        super
      end

      def draw
        # TODO: move image's loading to a proper loader
        @head ||= Helper::Resource.load('res/snake-head.bmp')
        @head.draw_rot(@pos_x, @pos_y, 0, @rotation)
      end

      def handle_keyboard
        handle_turning_left
        handle_turning_right
      end

      private

      def handle_turning_left
        return unless
          (Gosu.button_down? Gosu::KbLeft) ||
          (Gosu.button_down? Gosu::GpLeft)
        turn_left
      end

      def handle_turning_right
        return unless
          (Gosu.button_down? Gosu::KbRight) ||
          (Gosu.button_down? Gosu::GpRight)
        turn_right
      end
    end
  end
end
