require 'ruby/helper/resources/loader'
require 'ruby/snake/game/entity/entity'
require 'ruby/snake/game/collision/circle'

module Ruby
  module Snake
    module Game
      module Bonuses
        # apple bonus (gives speed)
        # TODO: extract Bonus and Consumable base classes/mixins
        class Cherry < Game::Entity
          # TODO: get this resource from some kind of resource container
          @@image = Helper::Resource.load('res/cherry.bmp')
          include Game::Collision::Circle

          attr_reader :consumed

          def initialize(pos_x, pos_y)
            @diameter = @@image.height
            @consumed = false
            super pos: [pos_x, pos_y]
          end

          def draw
            return if consumed
            # TODO: extract mixin for centered image drawing
            @@image.draw(
              @pos_x - @@image.width / 2,
              @pos_y - @@image.height / 2,
              -1
            )
          end

          def collide(entity)
            # TODO: move 'is consumed' testing to proper Consumable class/mixin
            return if consumed
            collides = entity.collide_circle(self) rescue false
            on_collision(entity) if collides
          end

          def on_collision(entity)
            @consumed = true
            entity.apply(on_consumption_effects)
          end

          def on_consumption_effects
            { speed: +0.1 }
          end
        end
      end
    end
  end
end
