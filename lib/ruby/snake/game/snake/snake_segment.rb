require 'ruby/snake/game/entity/angle_based_entity'
require 'gosu'
module Ruby
  module Snake
    module Game
      module Snake
        # Snake Segment is an angle based entity,
        class SnakeSegment < Game::AngleBasedEntity
          @@segment_image = Helper::Resource.load('res/snake-segment.bmp')
          @@offset = @@segment_image.height / 10

          def image
            @@segment_image
          end

          def zorder
            0
          end

          def self.offset
            @@offset
          end

          def draw(camera)
            # TODO: move image's loading to a proper loader
            image.draw_rot(
              *camera.translate(pos),
              zorder, @rotation
            )
          end
        end
      end
    end
  end
end
