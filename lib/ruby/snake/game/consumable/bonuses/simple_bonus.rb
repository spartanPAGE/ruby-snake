require 'ruby/snake/game/consumable/bonuses/bonus'

module Ruby
  module Snake
    module Game
      module Bonuses
        # simple bonus
        class SimpleBonus < Bonus
          @@simple_bonus_sound = Helper::Resource.load('res/suck-up.wav')
          # to be overriden
          def image
            nil
          end

          def sound
            @@simple_bonus_sound
          end

          def initialize(pos_x, pos_y)
            super(pos_x, pos_y, calc_diameter)
          end

          def draw(camera)
            super { image }
          end

          def on_consumption_effects
            sound.play
            { speed: +0.001, grow: true }
          end

          private

          def calc_diameter
            (image.width + image.height) / 2
          end
        end
      end
    end
  end
end
