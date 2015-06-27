require 'pdf/inspector'
require_relative '../init'
require_relative '../views/weekly_dinners'

RSpec.describe WeeklyDinners, "#render" do
  it 'renders a pdf' do
    WeeklyDinners.render(Dinner.week(3))
    text_analysis = PDF::Inspector::Text.analyze('../dinners.pdf')
    expect(text_analysis.strings).to include("foo")
  end
end
