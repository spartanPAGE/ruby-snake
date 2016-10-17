require 'ruby/helper/resources/loader'

module Ruby
  module Snake
    module Game
      module Tiles
        # class for drawing the ground (and, maybe in the future, other tiles)
        class Drawer
          @@ground_zorder = -1000
          @@ground = Helper::Resource.load('res/ground.jpg')

          def draw(screen_width, screen_height)
            0.step(screen_height, @@ground.height - 2) do |y|
              0.step(screen_width, @@ground.width - 2) do |x|
                @@ground.draw(x, y, @@ground_zorder)
              end
            end
          end
        end
      end
    end
  end
end
