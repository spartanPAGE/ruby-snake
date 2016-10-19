require 'spec_helper'
require 'ruby/snake/game/consumable/container'

# mock that returns true when consumed? is being called
class ConsumedConsumableMock
  def consumed?
    true
  end
end

# mock that has collide method
class CollidableConsumableMock
  attr_reader :collide_called
  def collide(*)
    @collide_called = true
  end

  def consumed?
    false
  end
end

describe Ruby::Snake::Game::Consumable::Container do
  let(:container) { Ruby::Snake::Game::Consumable::Container.new }
  describe '#new' do
    it 'has empty consumables list' do
      expect(container.consumables).to be_empty
    end
  end

  describe '#add' do
    it 'adds consumable' do
      5.times { container.add nil }
      expect(container.consumables.length).to eq(5)
    end
  end

  describe '#filter' do
    specify 'removes both nil and consumed? consumables' do
      5.times { container.add nil }
      5.times { container.add ConsumedConsumableMock.new }
      expect(container.consumables.length).to eq(10)
      container.filter
      expect(container.consumables).to be_empty
    end
  end

  describe '#collide' do
    specify 'calls #collide on every consumable' do
      5.times { container.add CollidableConsumableMock.new }
      container.collide nil

      container.consumables.each do |consumable|
        expect(consumable.collide_called).to eq(true)
      end
    end
  end

  describe '#filter_and_collide' do
    specify 'calls both #filter and #collide' do
      5.times { container.add nil }
      5.times { container.add ConsumedConsumableMock.new }
      3.times { container.add CollidableConsumableMock.new }
      container.filter_and_collide nil
      expect(container.consumables.length).to eq(3)
      container.consumables.each do |consumable|
        expect(consumable.collide_called).to eq(true)
      end
    end
  end
end
