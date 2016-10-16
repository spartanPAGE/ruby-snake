require 'gosu'

require 'ruby/snake/game/snake_entity'
require 'ruby/snake/game/delta_time'
require 'ruby/snake/game/consumable/bonuses/cherry'
require 'ruby/snake/game/consumable/container'
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
          @consumables = Snake::Game::Consumable::Container.new
        end

        def update
          Game::Time.update Gosu.milliseconds
          @snake.update
          @consumables.collide @snake

          # TODO: create specialized class for bonuses spawning
          @consumables.add Bonuses::Cherry.new(
            rand(0..width),
            rand(0..height)
          ) if (Gosu.milliseconds % 100).zero?
        end

        def draw
          @snake.draw
          @consumables.draw
        end
      end
    end
  end
end
