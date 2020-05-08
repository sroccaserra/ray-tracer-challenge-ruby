require 'light'
require 'math/rotation'
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
      r = Ray.new(NULL_POINT, vector(0, 0, 1))

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
      sphere = Sphere.new(scaling(2, 2, 2))

      xs = sphere.intersect(r)

      expect(xs.map(&:t)).to eq [3, 7]
    end

    it 'misses the ray when translated' do
      r = Ray.new(point(0, 0, -5), vector(0, 0, 1))
      sphere = Sphere.new(translation(5, 0, 0))

      xs = sphere.intersect(r)

      expect(xs).to be_empty
    end
  end

  describe 'normals' do
    describe 'on untransformed spheres' do
      before(:each) do
        @sphere = Sphere.new()
      end

      it 'computes at a given point on the x axis' do
        p = point(1, 0, 0)

        expect(@sphere.normal_at(p)).to eq vector(1, 0, 0)
      end

      it 'computes at a given point on the y axis' do
        p = point(0, 1, 0)

        expect(@sphere.normal_at(p)).to eq vector(0, 1, 0)
      end

      it 'computes at a given point on the z axis' do
        p = point(0, 0, 1)

        expect(@sphere.normal_at(p)).to eq vector(0, 0, 1)
      end

      it 'computes at a non axial point' do
        u = Math.sqrt(3)/3
        p = point(u, u, u)

        expect(@sphere.normal_at(p)).to eq vector(u, u, u)
      end

      it 'returns a normalized vector' do
        u = Math.sqrt(3)/3
        p = point(u, u, u)

        n = @sphere.normal_at(p)

        expect(n.normalize).to eq n
      end
    end

    describe 'on transformed spheres' do
      it 'computes on a translated sphere' do
        sphere = Sphere.new(translation(0, 1, 0))

        n = sphere.normal_at(point(0, 1.70711, -0.70711))

        expect(n).to eq_epsilon vector(0, 0.70711, -0.70711)
      end

      it 'computes on a scaled and rotated sphere' do
        sphere = Sphere.new(scaling(1, 0.5, 1)*rotation_z(Math::PI/5))

        n = sphere.normal_at(point(0, Math.sqrt(2)/2, -Math.sqrt(2)/2))

        expect(n).to eq_epsilon vector(0, 0.97014, -0.24254)
      end
    end
  end

  describe 'lighting' do
    it 'computes lighting' do
      sphere = Sphere.new
      eye_vector = vector(0, 0, 1)
      light = PointLight.new(point(0, 0, -5), WHITE)
      p = point(0, 0, -1)

      expect(sphere.lighting(light, p, eye_vector)).to eq WHITE
    end
  end
end
