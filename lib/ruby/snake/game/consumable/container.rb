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
            @consumables.each do |consumable|
              consumable.collide entity
            end
          end

          def draw(camera)
            @consumables.each do |consumable|
              consumable.draw camera
            end
          end

          def filter
            @consumables.compact!
            @consumables.reject!(&:consumed?)
          end

          def filter_and_collide(entity)
            filter
            collide entity
          end
        end
      end
    end
  end
end
