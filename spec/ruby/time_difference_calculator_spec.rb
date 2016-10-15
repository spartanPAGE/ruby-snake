require 'spec_helper'
require 'ruby/helper/time/time_difference_calculator'

describe Ruby::Helper::Time::TimeDifferenceCalculator do
  let(:time) { Ruby::Helper::Time::TimeDifferenceCalculator.new }
  it 'gives delta eq to 0 when created with default values' do
    expect(time.delta).to eq 0
  end

  it('gives proper delta when updates are called') do
    time.update 1
    expect(time.delta).to eq 1

    time.update 5
    expect(time.delta).to eq 4

    time.update 10
    expect(time.delta).to eq 5
  end
end
