require_relative '../lib/ray_tracer.rb'

describe '#tuple' do
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

describe 'adding tuples' do
  it 'should add a point and a vector' do
    a = point(3, -2, 5)
    b = vector(-2, 3, 1)

    expect(a + b).to eq point(1, 1, 6)
  end

  it 'should add two vectors' do
    v1 = vector(3, -2, 5)
    v2 = vector(-2, 3, 1)

    expect(v1 + v2).to eq vector(1, 1, 6)
  end

  it 'should substract two points' do
    p1 = point(3, 2, 1)
    p2 = point(5, 6, 7)

    expect(p1 - p2).to eq vector(-2, -4, -6)
  end

  it 'should supstract a vector from a point' do
    p = point(3, 2, 1)
    v = vector(5, 6, 7)

    expect(p - v).to eq point(-2, -4, -6)
  end

  it 'should substract two vectors' do
    v1 = vector(3, 2, 1)
    v2 = vector(5, 6, 7)

    expect(v1 - v2).to eq vector(-2, -4, -6)
  end

  it 'should substract from the zero vector' do
    zero = vector(0, 0, 0)
    v = vector(1, -2, 3)

    expect(zero - v).to eq vector(-1, 2, -3)
  end

  describe '#negate' do
    it 'should negate a tuple' do
      a = tuple(1, -2, 3, -4)

      expect(a.negate).to eq tuple(-1, 2, -3, 4)
    end
  end
end
