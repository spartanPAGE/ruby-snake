require 'gosu'
require 'ruby/helper/resources/loader'
require 'ruby/snake/game/angle_based_entity'

module Ruby
  module Snake
    class SnakeHead < Game::AngleBasedEntity
      @@head = Helper::Resource.load('res/snake-head.bmp')

      def update
        handle_keyboard
        super
      end

      def draw
        @@head.draw_rot(@pos_x, @pos_y, @z_order, @rotation)
      end

      def handle_keyboard
        if Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft then
          turn_left
        end
        if Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight then
          turn_right
        end
      end
    end
  end
end
