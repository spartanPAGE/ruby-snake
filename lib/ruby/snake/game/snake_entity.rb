require 'ruby/snake/game/snake/snake_head'

module Ruby
  module Snake
    module Game
      # snake entity
      class SnakeEntity
        attr_reader :head
        attr_reader :segments

        def initialize(*args)
          @head = Snake::SnakeHead.new(*args)
          @segments = []
        end

        def update(delta_time = -> { Game::Time.delta })
          @head.update delta_time
        end

        def draw
          @head.draw
        end

        def collide_circle(entity)
          @head.collide_circle entity
        end

        def apply(effects)
          @head.speed += effects[:speed] if effects.key? :speed
          grow                           if effects.key? :grow
        end

        def grow
        end
      end
    end
  end
end
