require 'spec_helper'
require 'ruby/snake/game/angle_based_entity'

describe Ruby::Snake::Game::AngleBasedEntity do
  AngleBasedEntity = Ruby::Snake::Game::AngleBasedEntity

  context 'is created properly' do
    let(:entity) do
      AngleBasedEntity.new(pos: [10, 15], angle: 5, speed: 1)
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
  end
end
