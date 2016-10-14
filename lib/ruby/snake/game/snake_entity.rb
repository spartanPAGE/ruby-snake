require 'gosu'
require 'ruby/helper/resources/loader'
require 'ruby/snake/game/entity'


module Ruby
  module Snake
    class SnakeHead < Game::Entity
      attr_accessor :speed

      @@head = Helper::Resource.load('res/snake-head.bmp')


      def initialize(pos_x: 0, pos_y: 0, angle: 0.0, speed: 0.0)
        @speed = speed
        super(pos_x: pos_x, pos_y: pos_y, rotation: angle)
      end

      def update
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
