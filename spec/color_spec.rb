require_relative '../lib/color.rb'

describe 'Color' do
  it 'should have red, green, blue components' do
    c = color(-0.5, 0.4, 1.7)

    expect(c.red).to eq(-0.5)
    expect(c.green).to eq 0.4
    expect(c.blue).to eq 1.7
  end

  it 'should add to another color' do
    c1 = color(0.9, 0.6, 0.75)
    c2 = color(0.7, 0.1, 0.25)

    expect(c1 + c2).to eq color(1.6, 0.7, 1)
  end
end
