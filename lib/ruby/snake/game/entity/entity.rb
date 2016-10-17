require 'matrix'

module Ruby
  module Snake
    module Game
      # provides:
      # - position, rotation
      class Entity
        attr_accessor :pos_x, :pos_y
        attr_accessor :rotation

        def initialize(pos: [0, 0], rotation: 0.0)
          @pos_x = pos[0]
          @pos_y = pos[1]
          @rotation = rotation
        end

        def pos
          Vector[@pos_x, @pos_y]
        end

        def pos=(vec)
          @pos_x, @pos_y = *vec
        end
      end
    end
  end
end
