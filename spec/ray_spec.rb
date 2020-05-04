require_relative '../lib/math/scaling'
require_relative '../lib/math/translation'
require_relative '../lib/math/tuple'
require_relative '../lib/ray'

describe 'Ray' do
  it 'computes a point from a distance' do
    r = Ray.new(point(2, 3, 4), vector(1, 0, 0))

    expect(r.position(0)).to eq point(2, 3, 4)
    expect(r.position(1)).to eq point(3, 3, 4)
    expect(r.position(-1)).to eq point(1, 3, 4)
    expect(r.position(2.5)).to eq point(4.5, 3, 4)
  end

  describe 'transformations' do
    before(:each)  do
      @ray = Ray.new(point(1, 2, 3), vector(0, 1, 0))
    end

    it 'translates' do
      m = translation(3, 4, 5)

      expect(@ray.transform(m)).to eq Ray.new(point(4, 6, 8), vector(0, 1, 0))
    end

    it 'scales' do
      m = scaling(2, 3, 4)

      expect(@ray.transform(m)).to eq Ray.new(point(2, 6, 12), vector(0, 3, 0))
    end
  end
end
