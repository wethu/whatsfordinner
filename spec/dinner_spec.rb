require_relative '../init'
require_relative '../models/dinner'
RSpec.describe Dinner, "#week" do
  it 'should provide 7 dinners for a week' do
    weekly_dinners = Dinner.week
    expect(weekly_dinners).count.to eq(7)
  end
end
