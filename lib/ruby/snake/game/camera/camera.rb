require 'matrix'

module Ruby
  module Snake
    module Game
      # Applies projection transformations
      class Camera
        attr_reader :focus, :viewport

        def initialize(viewport)
          @focus = [0, 0]
          @viewport = viewport
        end

        def look_at(vec)
          @focus = vec
        end

        def transformation_vector
          Vector[
            -@focus[0] + @viewport[0] / 2,
            -@focus[1] + @viewport[1] / 2
          ]
        end

        def relative_position(vec)
          vec + transformation_vector
        end

        alias translate relative_position
      end
    end
  end
end
