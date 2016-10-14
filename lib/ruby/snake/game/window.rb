require 'gosu'
require 'ruby/snake/game/snake_entity'

module Ruby
  module Snake
    module Game
      class Window < Gosu::Window
        def initialize
          super(640*2, 480*2)
          self.caption = "Snake game"
          @snake = SnakeHead.new(pos_x: 100, pos_y: 100, speed: 0.1, angle: 2, torsion_angle: 4.5)
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
