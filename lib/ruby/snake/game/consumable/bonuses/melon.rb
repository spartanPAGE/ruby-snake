require 'ruby/helper/resources/loader'
require 'ruby/snake/game/consumable/bonuses/simple_bonus'

module Ruby
  module Snake
    module Game
      module Bonuses
        # melon bonus
        class Melon < SimpleBonus
          def image
            @@image ||= Helper::Resource.load('res/melon.bmp')
          end
        end
      end
    end
  end
end
