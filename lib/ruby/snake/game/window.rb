require 'gosu'
require 'ruby/helper/resources/loader'

module Ruby
  module Snake
    module Game
      class Window < Gosu::Window
        def initialize
          super(640, 480)
          self.caption = "Snake game"

          @image = Helper::Resource::load('res/hello.bmp')
        end

        def update
        end

        def draw
          @image.draw(0, 0, 0)
        end
      end
    end
  end
end
