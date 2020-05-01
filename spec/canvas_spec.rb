require_relative '../lib/canvas'
require_relative '../lib/color'

describe 'Canvas' do
  it 'should be blank at creation' do
    c = Canvas.new(10, 20)
    expect(c.width).to be 10
    expect(c.height).to be 20

    expect(c.is_blank?).to be true
  end

  it 'should allow writing pixels' do
    c = Canvas.new(10, 20)
    red = color(1, 0, 0)
    c.write_pixel(2, 3, red)

    expect(c.is_blank?).to be false
  end
end
