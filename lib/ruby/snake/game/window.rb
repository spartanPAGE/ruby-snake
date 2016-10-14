require 'gosu'
require 'ruby/snake/game/snake_entity'

module Ruby
  module Snake
    module Game
      class Window < Gosu::Window
        def initialize
          super(640, 480)
          self.caption = "Snake game"
          @snake = SnakeHead.new(pos_x: 100, pos_y: 100, vel_x: 1, vel_y: 1, rotation_vel: 1.4)
        end

        def update
          @snake.update
        end

        def draw
          @snake.draw
        end
      end
    end
  end
end
