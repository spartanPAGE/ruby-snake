require 'ruby/helper/time/time_difference_calculator'

module Ruby
  module Snake
    module Game
      # singleton helper with delta calculus
      class Time
        class << self
          def calculator
            @calculator ||= Helper::Time::TimeDifferenceCalculator.new
          end

          def delta
            calculator.delta
          end

          def update(time)
            calculator.update time
          end

          private_class_method :new
        end
      end
    end
  end
end
