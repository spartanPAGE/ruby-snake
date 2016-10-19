require 'ruby/helper/resources/loader'
require 'ruby/snake/game/consumable/bonuses/simple_bonus'

module Ruby
  module Snake
    module Game
      module Bonuses
        # cherry bonus
        class Cherry < SimpleBonus
          def image
            @@image ||= Helper::Resource.load('res/cherry.bmp')
          end
        end
      end
    end
  end
end
