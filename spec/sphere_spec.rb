require 'math/rtc_tuple'
require 'ray'
require 'sphere'

describe 'Sphere' do
  it 'intersects with a ray at two points' do
    r = Ray.new(point(0, 0, -5), vector(0, 0, 1))
    s = Sphere.new(point(0, 0, 0), 1)

    xs = s.intersect(r)

    expect(xs).to eq [4, 6]
  end
end
