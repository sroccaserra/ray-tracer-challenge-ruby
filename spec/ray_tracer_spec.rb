require_relative '../lib/ray_tracer.rb'

describe 'Tuples' do
  describe 'A tuple with w=1.0' do
    it 'should have x, y, z, w coordinates' do
      a = tuple(4.3, -4.2, 3.1, 1.0)

      expect(a.x).to eq 4.3
      expect(a.y).to eq(-4.2)
      expect(a.z).to eq 3.1
      expect(a.w).to eq 1.0
    end

    it 'should be a point'do
      a = tuple(4.3, -4.2, 3.1, 1.0)

      expect(a).to be_a RayTracer::Point
    end
  end

  describe 'A tuple with w=0' do
    it 'should have x, y, z, w coordinates' do
      a = tuple(4.3, -4.2, 3.1, 0)

      expect(a.x).to eq 4.3
      expect(a.y).to eq(-4.2)
      expect(a.z).to eq 3.1
      expect(a.w).to eq 0
    end

    it 'should be a vector'do
      a = tuple(4.3, -4.2, 3.1, 0)

      expect(a).to be_a RayTracer::Vector
    end
  end
end

describe '#point' do
  it 'should create tuples with w=1' do
    p = point(4, -4, 3)

    expect(p).to eq tuple(4, -4, 3, 1)
  end
end

describe '#vector' do
  it 'should create tuples with w=0' do
    p = vector(4, -4, 3)

    expect(p).to eq tuple(4, -4, 3, 0)
  end
end
