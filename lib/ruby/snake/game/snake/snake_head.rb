require 'gosu'
require 'ruby/helper/resources/loader'
require 'ruby/snake/game/entity'
require 'ruby/snake/game/delta_time'

module Ruby
  module Snake
    class SnakeHead < Game::Entity
      attr_accessor :speed
      attr_accessor :torsion_angle

      @@head = Helper::Resource.load('res/snake-head.bmp')


      def initialize(pos_x: 0, pos_y: 0, angle: 0.0, speed: 0.0, torsion_angle: 0.0)
        @speed = speed
        @torsion_angle = torsion_angle
        super(pos_x: pos_x, pos_y: pos_y, rotation: angle)
      end

      def turn_left
        @rotation -= @torsion_angle
      end

      def turn_right
        @rotation += @torsion_angle
      end

      def update
        handle_keyboard
        update_movement_velocity
        super
      end

      def draw
        @@head.draw_rot(@pos_x, @pos_y, @z_order, @rotation)
      end

      def update_movement_velocity
        @vel_x = Gosu::offset_x(@rotation, @speed)
        @vel_y = Gosu::offset_y(@rotation, @speed)
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
