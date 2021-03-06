require 'spec_helper'
require 'ruby/snake/game/entity/entity'
describe Ruby::Snake::Game::Entity do
  Entity = Ruby::Snake::Game::Entity

  context 'is created properly' do
    let(:entity) { Entity.new(pos: [10, 15], rotation: 25) }
    it 'has proper values' do
      expect(entity.pos_x).to eq(10)
      expect(entity.pos_y).to eq(15)
      expect(entity.rotation).to eq(25)
    end

    it 'accesses proper values in pos alias' do
      expect(entity.pos).to eq(Vector[10, 15])
      entity.pos = [1, 1]
      expect(entity.pos).to eq(Vector[1, 1])
    end
  end
end
