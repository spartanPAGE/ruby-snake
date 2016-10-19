require 'spec_helper'
require 'ruby/snake/game/consumable/consumable'

# for testing purposes
class Consumable
  attr_reader :draw_called, :collide_called
  include Ruby::Snake::Game::Consumable::Consumable
  def initialize
    @draw_called = false
    @collide_called = false
    super
  end

  def draw
    super { @draw_called = true }
  end

  def collide
    super(nil) { @collide_called = true }
  end

  def consume
    @consumed = true
  end
end

describe Ruby::Snake::Game::Consumable::Consumable do
  describe '#new' do
    it 'creates unconsumed consumable' do
      expect(Consumable.new.consumed?).to eq(false)
    end
  end

  describe '#consumed?' do
    let(:consumable) { Consumable.new }
    context 'true' do
      it 'allows #draw and #collide to be called when' do
        expect(consumable.draw_called).to eq(false)
        expect(consumable.collide_called).to eq(false)

        consumable.draw
        consumable.collide

        expect(consumable.draw_called).to eq(true)
        expect(consumable.collide_called).to eq(true)
      end
    end

    context 'false' do
      it 'it disallows #draw and #collide to be called' do
        consumable.consume

        consumable.draw
        consumable.collide

        expect(consumable.draw_called).to eq(false)
        expect(consumable.collide_called).to eq(false)
      end
    end
  end
end
