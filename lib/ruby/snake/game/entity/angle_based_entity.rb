require 'gosu'
require 'ruby/snake/game/entity/moving_entity'

module Ruby
  module Snake
    module Game
      # AngleBasedEntity is a GameEntity designed
      # for angle+length based movement
      class AngleBasedEntity < Game::MovingEntity
        attr_accessor :speed
        attr_accessor :torsion_angle

        def initialize(pos: [0, 0],
                       angle: 0.0, speed: 0.0, torsion_angle: 0.0)
          @speed = speed
          @torsion_angle = torsion_angle
          super(pos: pos, rotation: angle)
        end

        def turn_left
          @rotation_vel -= @torsion_angle
        end

        def turn_right
          @rotation_vel += @torsion_angle
        end

        def update(delta_time = -> { Game::Time.delta })
          update_movement_velocity
          super delta_time
          @rotation_vel = 0
        end

        def update_movement_velocity
          @vel_x = Gosu.offset_x(@rotation, @speed)
          @vel_y = Gosu.offset_y(@rotation, @speed)
        end
      end
    end
  end
end
