require 'ruby/helper/resources/loader'

module Ruby
  module Snake
    module Game
      module Tiles
        # class for drawing the ground (and, maybe in the future, other tiles)
        class Drawer
          @@ground_zorder = -1000
          @@ground = Helper::Resource.load('res/ground.jpg')

          def draw(camera)
            off = offset(camera.focus)
            (-g.height).step(camera.viewport[1] + g.height, g.height) do |y|
              (-g.width).step(camera.viewport[0] + g.width, g.width) do |x|
                g.draw(*with_offset(x, y, off), @@ground_zorder)
              end
            end
          end

          private

          def with_offset(x, y, off)
            [x - off[0], y - off[1]]
          end

          def g
            @@ground
          end

          def offset(camera_focus)
            [
              camera_focus[0] % @@ground.width,
              camera_focus[1] % @@ground.height
            ]
          end
        end
      end
    end
  end
end
