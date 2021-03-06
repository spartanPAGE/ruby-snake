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
            y_axis(camera) do |y|
              x_axis(camera) do |x|
                draw_(x, y, camera)
              end
            end
          end

          private

          def draw_(x, y, camera)
            g.draw(
              *with_offset(
                fixed_value(x, g.width),
                fixed_value(y, g.height),
                offset(camera.focus)
              ),
              @@ground_zorder
            )
          end

          def fixed_value(axis, block_axis)
            axis * block_axis - axis % block_axis
          end

          def y_axis(camera)
            block_height(camera.viewport).downto(-1) do |y|
              yield y
            end
          end

          def x_axis(camera)
            block_width(camera.viewport).downto(-1) do |x|
              yield x
            end
          end

          def block_height(vp)
            (1 + vp[1] / g.height).floor
          end

          def block_width(vp)
            (1 + vp[0] / g.width).floor
          end

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
