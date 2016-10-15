require 'ruby/snake/game/delta_time'

module Ruby
  module Snake
    module Game
      # Game::Entity provides:
      # - position, velocity, rotation
      # - update method which updates position and rotation based
      #   on velocity values
      class Entity
        attr_accessor :pos_x, :pos_y
        attr_accessor :vel_x, :vel_y
        attr_accessor :rotation
        attr_accessor :rotation_vel

        def initialize(pos: [0, 0],
                       vel: [0.0, 0.0],
                       rotation: 0.0, rotation_vel: 0.0)
          @pos_x = pos[0]
          @pos_y = pos[1]
          @vel_x = vel[0]
          @vel_y = vel[1]
          @rotation = rotation
          @rotation_vel = rotation_vel
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
