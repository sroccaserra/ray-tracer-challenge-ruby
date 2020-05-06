require 'color'
require 'render/canvas'

describe 'Canvas' do
  before(:each) do
    @c = Canvas.new(10, 20)
  end

  it 'is blank at creation' do
    expect(@c.width).to be 10
    expect(@c.height).to be 20
    expect(@c.is_blank?).to be true
  end

  it 'allows writing pixels' do
    red = color(1, 0, 0)

    @c.write_pixel(2, 3, red)

    expect(@c.is_blank?).to be false
  end

  it 'allows reading pixels' do
    red = color(1, 0, 0)
    blue = color(0, 0, 1)

    @c.write_pixel(2, 3, red)
    @c.write_pixel(3, 4, blue)

    expect(@c.pixel_at(2, 3)).to eq red
    expect(@c.pixel_at(3, 4)).to eq blue
  end
end
