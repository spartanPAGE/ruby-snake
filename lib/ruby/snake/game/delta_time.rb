require 'gosu'

module Ruby
  module Snake
    module Game
      def self.delta_time
        return Gosu::milliseconds/1000
      end
    end
  end
end
