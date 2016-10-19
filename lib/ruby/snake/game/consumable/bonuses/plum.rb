require 'ruby/helper/resources/loader'
require 'ruby/snake/game/consumable/bonuses/simple_bonus'

module Ruby
  module Snake
    module Game
      module Bonuses
        # plum bonus
        class Plum < SimpleBonus
          def image
            @@image ||= Helper::Resource.load('res/plum.png')
          end
        end
      end
    end
  end
end
