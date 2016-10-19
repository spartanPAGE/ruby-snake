module Ruby
  module Snake
    module Game
      module Bonuses
        # class for bonuses spawning
        class Spawner
          attr_reader :classes
          def initialize(classes_with_delay, on_spawn)
            @classes_and_delay = classes_with_delay
            @on_spawn = on_spawn
          end

          def update(min_x, min_y, max_x, max_y, ms)
            @classes_and_delay.each do |klass, delay|
              @on_spawn.call klass.new(
                rand(min_x..max_x),
                rand(min_x..max_x)
              ) if (ms % delay).zero?
            end
          end
        end
      end
    end
  end
end
