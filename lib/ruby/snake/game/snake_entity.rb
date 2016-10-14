require 'gosu'
require 'ruby/helper/resources/loader'
require 'ruby/snake/game/entity'


module Ruby
  module Snake
    class SnakeHead < Game::Entity
      @@head = Helper::Resource.load('res/snake-head.bmp')

      def draw
        @@head.draw_rot(@pos_x, @pos_y, @z_order, @rotation)
      end
    end
  end
end
