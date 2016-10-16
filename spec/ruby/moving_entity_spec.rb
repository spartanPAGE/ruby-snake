require 'spec_helper'
require 'ruby/snake/game/moving_entity'

describe Ruby::Snake::Game::MovingEntity do
  Entity = Ruby::Snake::Game::MovingEntity

  context 'is created properly' do
    let(:entity) { Entity.new(pos: [10, 15], vel: [1, 2]) }
    it 'has proper position' do
      expect(entity.pos_x).to eq(10)
      expect(entity.pos_y).to eq(15)
    end

    it 'has proper velocity' do
      expect(entity.vel_x).to eq(1)
      expect(entity.vel_y).to eq(2)
    end
  end

  context 'moves properly' do
    let(:entity) { Entity.new(pos: [0, 0], vel: [10, -10]) }

    it 'performs first step with 2ms' do
      entity.update -> { 2 }

      expect(entity.pos_x).to eq(20)
      expect(entity.pos_y).to eq(-20)
    end

    it 'performs first step with 3ms' do
      entity.update -> { 3 }

      expect(entity.pos_x).to eq(30)
      expect(entity.pos_y).to eq(-30)
    end
  end
end
