require 'ruby/snake/game/snake/snake_head'
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
          refresh_segments if segments.any?
          @head.update delta_time
        end

        def refresh_segments
          offset = Snake::SnakeSegment.offset
          dx = @head.pos_x - Gosu.offset_x(@head.rotation, offset)
          dy = @head.pos_y - Gosu.offset_y(@head.rotation, offset)

          seg = Snake::SnakeSegment.new(
            pos: [dx, dy],
            angle: @head.rotation
          )
          @segments.pop
          @segments.unshift(seg)
        end

        def draw
          @head.draw

          @segments.reverse_each(&:draw)
        end

        def collide_circle(entity)
          @head.collide_circle entity
        end

        def apply(effects)
          @head.speed += effects[:speed] if effects.key? :speed
          grow                           if effects.key? :grow
        end

        def grow
          last = @segments.last || @head
          dx = last.pos_x
          dy = last.pos_y

          @segments << Snake::SnakeSegment.new(
            pos: [dx, dy],
            angle: last.rotation
          )
        end
      end
    end
  end
end
