module Ruby
  module Helper
    module Time
      # provides delta time calculations feature
      class TimeDifferenceCalculator
        attr_accessor :last_time, :actual_time

        def initialize(current_time: 0)
          @last_time = current_time
          @actual_time = current_time
        end

        def delta
          @actual_time - @last_time
        end

        def update(current_time)
          @last_time = @actual_time
          @actual_time = current_time
        end
      end
    end
  end
end
