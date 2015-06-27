require_relative '../init'
require_relative '../models/dinner'

RSpec.describe Dinner, "#week" do
  it 'should provide 7 dinners for a week' do
    weekly_dinners = Dinner.week
    expect(weekly_dinners.count).to eq(7)
  end

  it 'gives 3 unique shuffled weeks' do
    full_calender = Dinner.week(3)
    expect(full_calender.count).to eq(3)
    expect(full_calender.flatten.uniq.count).to eq(21)
  end

  it 'returns a uniq result each time' do
    round_1 = Dinner.week(3)
    round_2 = Dinner.week(3)
    expect(round_1).to_not match_array(round_2)
  end
end
