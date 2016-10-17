require 'ruby/helper/resources/loader'
require 'ruby/snake/game/entity/entity'
require 'ruby/snake/game/collision/circle'
require 'ruby/snake/game/consumable/consumable'
require 'matrix'

module Ruby
  module Snake
    module Game
      module Bonuses
        # apple bonus (gives speed)
        # TODO: extract Bonus base classe/mixin
        class Cherry < Game::Entity
          # TODO: get this resource from some kind of resource container
          @@image = Helper::Resource.load('res/cherry.bmp')
          @@sound = Helper::Resource.load('res/suck-up.wav')

          include Game::Collision::Circle
          include Game::Consumable::Consumable

          def initialize(pos_x, pos_y)
            @diameter = @@image.height
            @consumed = false
            super pos: [pos_x, pos_y]
          end

          def draw(camera)
            super do
              # TODO: extract mixin for centered image drawing
              @@image.draw(*camera.translate(centered_pos), -1)
            end
          end

          def collide(entity)
            super { entity.collide_circle(self) }
          end

          def on_consumption_effects
            @@sound.play
            { speed: +0.001, grow: true }
          end

          private

          def centered_pos
            Vector[
              @pos_x - @@image.width / 2,
              @pos_y - @@image.height / 2
            ]
          end
        end
      end
    end
  end
end
