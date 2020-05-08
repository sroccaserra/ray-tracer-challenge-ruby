require 'intersection'
require 'math/tuple'
require 'sphere'

describe 'Intersection' do
  before(:each) do
    @sphere = Sphere.new()
  end

  it 'finds the hit when all intersections have positive t' do
    i1 = Intersection.new(1, @sphere)
    i2 = Intersection.new(2, @sphere)

    expect(hit_from_intersections([i1, i2])).to be i1
  end

  it 'finds the hit when some intersections have negative t' do
    i1 = Intersection.new(-1, @sphere)
    i2 = Intersection.new(1, @sphere)

    expect(hit_from_intersections([i1, i2])).to be i2
  end

  it 'finds the hit when all intersections have negative t' do
    i1 = Intersection.new(-2, @sphere)
    i2 = Intersection.new(-1, @sphere)

    expect(hit_from_intersections([i1, i2])).to be_nil
  end

  it 'finds the hit from a bunch of intersections' do
    i1 = Intersection.new(5, @sphere)
    i2 = Intersection.new(7, @sphere)
    i3 = Intersection.new(-3, @sphere)
    i4 = Intersection.new(2, @sphere)

    expect(hit_from_intersections([i1, i2, i3, i4])).to be i4
  end
end
