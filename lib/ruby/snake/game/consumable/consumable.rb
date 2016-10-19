module Ruby
  module Snake
    module Game
      module Consumable
        # Consumable mixin with being-consumed-related methods
        module Consumable
          attr_reader :consumed

          def initialize
            @consumed = false
          end

          def consumed?
            @consumed
          end

          def draw(*)
            yield unless consumed?
          end

          def collide(entity)
            return if consumed?
            collides = yield rescue false
            on_collision(entity) if collides
          end

          def on_collision(entity)
            @consumed = true
            entity.apply(on_consumption_effects) if defined? entity.apply
          end

          def on_consumption_effects; end
        end
      end
    end
  end
end
