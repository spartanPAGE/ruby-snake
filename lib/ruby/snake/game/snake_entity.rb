require 'gosu'
require 'ruby/helper/resources/loader'
require 'ruby/snake/game/entity'


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

      def accelerate
        @speed += 0.1

      end

      def decelerate
        @speed -= 0.1
        if @speed < 0
          @speed = 0
        end
      end

      def update
        if Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft then
          turn_left
        end
        if Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight then
          turn_right
        end
        if Gosu::button_down? Gosu::KbUp or Gosu::button_down? Gosu::GpUp then
          accelerate
        end
        if Gosu::button_down? Gosu::KbDown or Gosu::button_down? Gosu::GpDown then
          decelerate
        end

        @vel_x = Gosu::offset_x(@rotation, @speed)
        @vel_y = Gosu::offset_y(@rotation, @speed)
        super
      end

      def draw
        @@head.draw_rot(@pos_x, @pos_y, @z_order, @rotation)
      end
    end
  end
end
