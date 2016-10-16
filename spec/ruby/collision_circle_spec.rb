require 'spec_helper'
require 'ruby/snake/game/collision/circle'

# class for testing
class CircleCollider
  include Ruby::Snake::Game::Collision::Circle

  def initialize(x, y, diam)
    @pos_x = x
    @pos_y = y
    @diameter = diam
  end
end

describe Ruby::Snake::Game::Collision::Circle do
  it 'collides with point' do
    circle = CircleCollider.new(0, 0, 10)
    expect(circle.collide_point(3, 3)).to eq(true)
    expect(circle.collide_point(5, 0)).to eq(true)
    expect(circle.collide_point(0, 5)).to eq(true)

    expect(circle.collide_point(5.0, 0.1)).to eq(false)
    expect(circle.collide_point(5.01, 0)).to eq(false)
    expect(circle.collide_point(4, 4)).to eq(false)

    expect(circle.collide_point(5, 0)).to eq(true)
    expect(circle.collide_point(5.000_001, 0)).to eq(false)
  end

  it 'collides with other circle' do
    circle = CircleCollider.new(0, 0, 10)

    expect(circle.collide_circle(CircleCollider.new(0, 0, 1))).to eq(true)
    expect(circle.collide_circle(CircleCollider.new(5, 0, 2))).to eq(true)

    expect(circle.collide_circle(CircleCollider.new(5, 1, 1))).to eq(false)

    expect(circle.collide_circle(CircleCollider.new(-5, 0, 0))).to eq(true)
  end
end
