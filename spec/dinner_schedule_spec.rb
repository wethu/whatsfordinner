require 'pdf/inspector'
require_relative '../init'
require_relative '../views/dinner_schedule'

RSpec.describe DinnerSchedule, "#render" do
  it 'renders a pdf with headings and dinners' do
    data = Dinner.week(3)
    random_day = rand(7)

    pdf = DinnerSchedule.new(data).render
    text_analysis = PDF::Inspector::Text.analyze(pdf)

    # Check for weekday headings
    expect(text_analysis.strings).to include(Date::DAYNAMES[random_day])

    # Check for a random dinner to be present
    dinner = data[rand(data.count)][random_day]
    expect(text_analysis.strings).to include(dinner.name.titleize)
  end
end
