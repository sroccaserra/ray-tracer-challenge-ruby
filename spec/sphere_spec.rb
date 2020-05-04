require 'math/scaling'
require 'math/translation'
require 'math/tuple'
require 'ray'
require 'sphere'

describe 'Sphere' do
  describe 'untransformed' do
    before(:each) do
      @sphere = Sphere.new()
    end

    it 'intersects with a ray at two points' do
      r = Ray.new(point(0, 0, -5), vector(0, 0, 1))

      xs = @sphere.intersect(r)

      expect(xs.map(&:t)).to eq [4, 6]
    end

    it 'intersects with a ray at a tangent' do
      r = Ray.new(point(0, 1, -5), vector(0, 0, 1))

      xs = @sphere.intersect(r)

      expect(xs.map(&:t)).to eq [5, 5]
    end

    it 'is missed by a ray' do
      r = Ray.new(point(0, 2, -5), vector(0, 0, 1))

      xs = @sphere.intersect(r)

      expect(xs).to be_empty
    end

    it 'intersects whith a ray that originates inside itself' do
      r = Ray.new(point(0, 0, 0), vector(0, 0, 1))

      xs = @sphere.intersect(r)

      expect(xs.map(&:t)).to eq [-1, 1]
    end

    it 'intersects even when behind a ray' do
      r = Ray.new(point(0, 0, 5), vector(0, 0, 1))

      xs = @sphere.intersect(r)

      expect(xs.map(&:t)).to eq [-6, -4]
    end
  end

  describe 'transformed' do
    it 'intersects with a ray when scaled' do
      r = Ray.new(point(0, 0, -5), vector(0, 0, 1))
      s = Sphere.new(scaling(2, 2, 2))

      xs = s.intersect(r)

      expect(xs.map(&:t)).to eq [3, 7]
    end

    it 'misses the ray when translated' do
      r = Ray.new(point(0, 0, -5), vector(0, 0, 1))
      s = Sphere.new(translation(5, 0, 0))

      xs = s.intersect(r)

      expect(xs).to be_empty
    end
  end
end
