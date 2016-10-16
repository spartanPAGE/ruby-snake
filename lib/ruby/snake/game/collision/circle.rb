require 'matrix'

module Ruby
  module Snake
    module Game
      module Collision
        # provides collide method strategy for circle based point collisions
        module Circle
          attr_accessor :diameter, :pos_x, :pos_y

          def radius
            diameter / 2
          end

          def distance(x, y)
            (Vector[@pos_x, @pos_y] - Vector[x, y]).r
          end

          def collide_point(x, y)
            distance(x, y) <= radius
          end

          def collide_circle(circle)
            distance(circle.pos_x, circle.pos_y) <= radius + circle.radius
          end
        end
      end
    end
  end
end
