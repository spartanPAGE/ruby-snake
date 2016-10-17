require 'ruby/snake/game/entity/angle_based_entity'

module Ruby
  module Snake
    module Game
      module Snake
        # Snake Segment is an angle based entity,
        class SnakeSegment < Game::AngleBasedEntity
          @@segment_image = Helper::Resource.load('res/snake-head.bmp')

          def image
            @@segment_image
          end

          def draw
            # TODO: move image's loading to a proper loader
            image.draw_rot(
              @pos_x,
              @pos_y,
              0, @rotation
            )
          end
        end
      end
    end
  end
end
