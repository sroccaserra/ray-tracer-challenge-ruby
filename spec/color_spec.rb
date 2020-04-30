require_relative '../lib/color.rb'

describe 'Color' do
  it 'should have red, green, blue components' do
    c = color(-0.5, 0.4, 1.7)

    expect(c.red).to eq(-0.5)
    expect(c.green).to eq 0.4
    expect(c.blue).to eq 1.7
  end
end
