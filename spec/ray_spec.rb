require_relative '../lib/math/rtc_tuple'
require_relative '../lib/ray'

describe 'Ray' do
  it 'computes a point from a distance' do
    r = Ray.new(point(2, 3, 4), vector(1, 0, 0))

    expect(r.position(0)).to eq point(2, 3, 4)
    expect(r.position(1)).to eq point(3, 3, 4)
    expect(r.position(-1)).to eq point(1, 3, 4)
    expect(r.position(2.5)).to eq point(4.5, 3, 4)
  end
end
