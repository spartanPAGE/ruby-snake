require 'gosu'

require 'ruby/snake/game/snake_entity'
require 'ruby/snake/game/delta_time'
require 'ruby/snake/game/consumable/bonuses/cherry'
require 'ruby/snake/game/consumable/container'
require 'ruby/snake/game/tiles/drawer'
require 'ruby/snake/game/camera/camera'

module Ruby
  module Snake
    module Game
      # Game window
      class Window < Gosu::Window
        def initialize
          super(640 * 2, 480 * 2)
          self.caption = 'Snake game'

          play_ambient
          create_snake

          @tiles = Ruby::Snake::Game::Tiles::Drawer.new
          @consumables = Ruby::Snake::Game::Consumable::Container.new
          @camera = Ruby::Snake::Game::Camera.new [width, height]
        end

        def play_ambient
          @ambient ||= Gosu::Song.new 'res/ambient.wav'
          @ambient.volume = 0.3
          @ambient.play true
        end

        def create_snake
          @snake ||= SnakeEntity.new(
            pos: [100, 100],
            speed: 0.3,
            angle: 180,
            torsion_angle: 0.4
          )
        end

        def update
          Game::Time.update Gosu.milliseconds
          @snake.update
          @consumables.collide @snake

          # TODO: create specialized class for bonuses spawning
          @consumables.add Bonuses::Cherry.new(
            rand(0..width),
            rand(0..height)
          ) if (Gosu.milliseconds % 10).zero?
        end

        def draw
          @camera.look_at @snake.pos

          @snake.draw @camera
          @consumables.draw @camera
          @tiles.draw @camera
        end
      end
    end
  end
end
