require 'spec_helper'
require 'gosu'
require 'ruby/snake/game/angle_based_entity'

describe Ruby::Snake::Game::AngleBasedEntity do
  AngleBasedEntity = Ruby::Snake::Game::AngleBasedEntity

  context 'is created properly' do
    let(:entity) do
      AngleBasedEntity.new(pos: [10, 15], angle: 5, speed: 1, torsion_angle: 5)
    end

    it 'has proper position' do
      expect(entity.pos_x).to eq(10)
      expect(entity.pos_y).to eq(15)
    end

    it 'has proper rotation' do
      expect(entity.rotation).to eq(5)
    end

    it 'has proper speed' do
      expect(entity.speed).to eq(1)
    end

    it 'can rotate left using torsion_angle' do
      entity.turn_left
      expect(entity.rotation).to eq(0)
      entity.turn_left
      expect(entity.rotation).to eq(-5)
    end

    it 'can rotate right using torsion_angle' do
      entity.turn_right
      expect(entity.rotation).to eq(10)
      entity.turn_right
      expect(entity.rotation).to eq(15)
    end

    it 'can update its velocity using rotation and speed' do
      expected_vel_x = Gosu.offset_x(entity.rotation, entity.speed)
      expected_vel_y = Gosu.offset_y(entity.rotation, entity.speed)

      entity.update_movement_velocity

      expect(entity.vel_x).to eq(expected_vel_x)
      expect(entity.vel_x).to eq(expected_vel_x)
    end

    it 'can update its position' do
      time = 1
      ex_pos_x = 10 + Gosu.offset_x(entity.rotation, entity.speed) * time
      ex_pos_y = 15 + Gosu.offset_y(entity.rotation, entity.speed) * time

      entity.update -> { time }
      expect(entity.pos_x).to eq(ex_pos_x)
      expect(entity.pos_y).to eq(ex_pos_y)
    end
  end
end
