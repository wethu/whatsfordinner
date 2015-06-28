require_relative '../init'
require_relative '../lib/string'

RSpec.describe String, "#titleize" do

  it 'capitalises word(s)' do
    expect('steak'.titleize).to eq('Steak')
    expect('Steak'.titleize).to eq('Steak')
    expect('steak_and_pie'.titleize).to eq('Steak And Pie')
    expect('Steak and pie'.titleize).to eq('Steak And Pie')
    expect(''.titleize).to eq('')
  end
end
