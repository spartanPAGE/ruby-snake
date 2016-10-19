require 'ruby/helper/resources/loader'
require 'ruby/snake/game/consumable/bonuses/bonus'

module Ruby
  module Snake
    module Game
      module Bonuses
        # cherry bonus (gives speed and makes the consumer grow)
        class Plum < Bonus
          # TODO: get this resource from some kind of resource container
          @@image = Helper::Resource.load('res/plum.png')
          @@sound = Helper::Resource.load('res/suck-up.wav')

          def initialize(pos_x, pos_y)
            super(pos_x, pos_y, @@image.height)
          end

          def draw(camera)
            super { @@image }
          end

          def on_consumption_effects
            @@sound.play
            { speed: +0.001, grow: true }
          end
        end
      end
    end
  end
end
