module Ruby
  module Snake
    module Game
      module Consumable
        # manager for all of the consumables.
        # TODO: tests
        class Container
          attr_accessor :consumables

          def initialize
            @consumables = []
          end

          def add(consumable)
            @consumables << consumable
          end

          def collide(entity)
            filter_consumables

            @consumables.each do |consumable|
              consumable.collide entity
            end
          end

          def draw
            @consumables.each(&:draw)
          end

          private

          def filter_consumables
            @consumables.reject!(&:consumed)
          end
        end
      end
    end
  end
end
