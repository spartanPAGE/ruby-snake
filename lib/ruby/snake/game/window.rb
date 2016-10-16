require 'gosu'

require 'ruby/snake/game/snake_entity'
require 'ruby/snake/game/delta_time'
require 'ruby/snake/game/consumable/bonuses/cherry'
module Ruby
  module Snake
    module Game
      # Game window
      class Window < Gosu::Window
        def initialize
          super(640 * 2, 480 * 2)
          self.caption = 'Snake game'
          @snake = SnakeHead.new(
            pos: [100, 100],
            speed: 0.5,
            angle: 180,
            torsion_angle: 4.5
          )
          @cherry = Bonuses::Cherry.new(200, 200)
        end

        def update
          Game::Time.update Gosu.milliseconds
          @snake.update
          @cherry.collide @snake
        end

        def draw
          @snake.draw
          @cherry.draw
        end
      end
    end
  end
end
