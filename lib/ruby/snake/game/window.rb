require 'gosu'

module Ruby
  module Snake
    module Game
      class Window < Gosu::Window
        def initialize
          super(640, 480)
          self.caption = "Snake game"
        end

        def update
        end

        def draw
        end
      end
    end
  end
end
