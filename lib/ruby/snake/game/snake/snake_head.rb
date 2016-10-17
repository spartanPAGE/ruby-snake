require 'gosu'
require 'ruby/helper/resources/loader'
require 'ruby/snake/game/collision/circle'
require 'ruby/snake/game/snake/snake_segment'

module Ruby
  module Snake
    module Game
      module Snake
        # player input
        module PlayerInput
          def handle_keyboard
            handle_turning_left
            handle_turning_right
          end

          private

          def handle_turning_left
            return unless
              (Gosu.button_down? Gosu::KbLeft) ||
              (Gosu.button_down? Gosu::GpLeft)
            turn_left
          end

          def handle_turning_right
            return unless
              (Gosu.button_down? Gosu::KbRight) ||
              (Gosu.button_down? Gosu::GpRight)
            turn_right
          end
        end

        # Snake head is an angle based entity,
        # that handles player input and draws itself
        class SnakeHead < SnakeSegment
          include Game::Collision::Circle
          include PlayerInput

          @@head_image = Helper::Resource.load('res/snake-head.bmp')

          def image
            @@head_image
          end

          def initialize(*args)
            @diameter = @@head_image.height
            super(*args)
          end

          def zorder
            1
          end

          def update(delta_time = -> { Game::Time.delta })
            handle_keyboard
            super delta_time
          end
        end
      end
    end
  end
end
