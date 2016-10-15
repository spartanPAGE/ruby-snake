require 'gosu'
require 'ruby/snake/game/entity'

module Ruby
  module Snake
    module Game
      class AngleBasedEntity < Game::Entity
        attr_accessor :speed
        attr_accessor :torsion_angle

        def initialize(pos_x: 0, pos_y: 0, angle: 0.0, speed: 0.0, torsion_angle: 0.0)
          @speed = speed
          @torsion_angle = torsion_angle
          super(pos_x: pos_x, pos_y: pos_y, rotation: angle)
        end

        def turn_left
          @rotation -= @torsion_angle
        end

        def turn_right
          @rotation += @torsion_angle
        end

        def update
          update_movement_velocity
          super
        end

        def update_movement_velocity
          @vel_x = Gosu::offset_x(@rotation, @speed)
          @vel_y = Gosu::offset_y(@rotation, @speed)
        end
      end
    end
  end
end
