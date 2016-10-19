require 'ruby/helper/resources/loader'
require 'ruby/snake/game/entity/entity'
require 'ruby/snake/game/collision/circle'
require 'ruby/snake/game/consumable/consumable'
require 'matrix'

module Ruby
  module Snake
    module Game
      module Bonuses
        # bonus base class
        class Bonus < Game::Entity
          include Game::Collision::Circle
          include Game::Consumable::Consumable

          def initialize(pos_x, pos_y, diameter)
            @diameter = diameter
            @consumed = false
            super pos: [pos_x, pos_y]
          end

          def consumed?
            @consumed
          end

          def consume
            @consumed = true
          end

          # yield should return image that we can call .draw on
          def draw(camera)
            super { yield.draw(*camera.translate(centered_pos), -1) }
          end

          def collide(entity)
            super { entity.collide_circle(self) }
          end

          private

          def centered_pos
            Vector[
              @pos_x - @diameter / 2,
              @pos_y - @diameter / 2
            ]
          end
        end
      end
    end
  end
end
