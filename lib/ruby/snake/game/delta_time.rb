module Ruby
  module Snake
    module Game
      @@actual_time = 0
      @@last_time = 0

      def self.delta_time
        @@actual_time - @@last_time
      end

      def self.update_delta_time(milis)
        @@last_time = @@actual_time
        @@actual_time = milis
      end
    end
  end
end
