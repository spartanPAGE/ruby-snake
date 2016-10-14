module Ruby
  module Snake
    module Game
      class Entity
        attr_accessor :pos_x, :pos_y
        attr_accessor :vel_x, :vel_y
        attr_accessor :z_order
        attr_accessor :rotation
        attr_accessor :rotation_vel

        def initialize(pos_x: 0, pos_y: 0, vel_x: 0.0, vel_y: 0.0, z_order: 0, rotation: 0.0, rotation_vel: 0.0)
          @pos_x = pos_x
          @pos_y = pos_y
          @vel_x = vel_x
          @vel_y = vel_y
          @z_order = z_order
          @rotation = rotation
          @rotation_vel = rotation_vel
        end

        def update
          @pos_x += @vel_x
          @pos_y += @vel_y
          @rotation += @rotation_vel
        end
      end
    end
  end
end