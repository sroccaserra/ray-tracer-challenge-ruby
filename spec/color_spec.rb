require_relative '../lib/color'

EPSILON = 0.00001

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

  it 'should substract from another color' do
    c1 = color(0.9, 0.6, 0.75)
    c2 = color(0.7, 0.1, 0.25)

    c3 = c1 - c2

    expect(c3.red).to be_within(EPSILON).of 0.2
    expect(c3.green).to eq 0.5
    expect(c3.blue).to eq 0.5
  end

  it 'should multiply by a scalar' do
    c = color(0.2, 0.3, 0.4)

    expect(c * 2).to eq color(0.4, 0.6, 0.8)
  end

  it 'should multiply by another color' do
    c1 = color(1, 0.2, 0.4)
    c2 = color(0.9, 1, 0.1)

    c3 = c1.mul(c2)
    expect(c3.red).to eq 0.9
    expect(c3.green).to eq 0.2
    expect(c3.blue).to be_within(EPSILON).of 0.04
  end
end
