require 'ruby/snake/game/delta_time'
require 'ruby/snake/game/entity'
module Ruby
  module Snake
    module Game
      # provides:
      # - velocity for position and rotation
      # - update method which updates position and rotation based
      #   on velocity values
      class MovingEntity < Game::Entity
        attr_accessor :vel_x, :vel_y
        attr_accessor :rotation_vel

        def initialize(pos: [0, 0],
                       vel: [0.0, 0.0],
                       rotation: 0.0, rotation_vel: 0.0)
          @vel_x = vel[0]
          @vel_y = vel[1]
          @rotation_vel = rotation_vel

          super(pos: pos, rotation: rotation)
        end

        def update(delta_time = -> { Game::Time.delta })
          @pos_x += @vel_x * delta_time.call
          @pos_y += @vel_y * delta_time.call
          @rotation += @rotation_vel * delta_time.call
        end
      end
    end
  end
end
