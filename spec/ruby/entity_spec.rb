require 'spec_helper'
require 'ruby/snake/game/entity'

describe Ruby::Snake::Game::Entity do
  Entity = Ruby::Snake::Game::Entity

  context 'is created properly' do
    let(:entity) { Entity.new(pos_x: 10, pos_y: 15, vel_x: 1, vel_y: 2) }
    it 'has proper position' do
      expect(entity.pos_x).to eq(10)
      expect(entity.pos_y).to eq(15)
    end

    it 'has propert velocity' do
      expect(entity.vel_x).to eq(1)
      expect(entity.vel_y).to eq(2)
    end
  end

  context 'moves properly' do
    let(:entity) { Entity.new(pos_x: 0, pos_y: 0, vel_x: 10, vel_y: -10) }

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
