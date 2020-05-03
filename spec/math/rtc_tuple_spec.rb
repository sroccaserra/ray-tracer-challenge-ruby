require 'math/rtc_tuple'

describe 'Tuple' do
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

      expect(a.is_point?).to be true
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

      expect(a.is_vector?).to be true
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

  describe '#+' do
    it 'should add a point and a vector' do
      a = point(3, -2, 5)
      b = vector(-2, 3, 1)

      expect(a + b).to eql point(1, 1, 6)
    end

    it 'should add two vectors' do
      v1 = vector(3, -2, 5)
      v2 = vector(-2, 3, 1)

      expect(v1 + v2).to eq vector(1, 1, 6)
    end
  end

  describe '#-' do
    it 'should substract two points' do
      p1 = point(3, 2, 1)
      p2 = point(5, 6, 7)

      expect(p1 - p2).to eq vector(-2, -4, -6)
    end

    it 'should substract a vector from a point' do
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
  end

  describe '#-@' do
    it 'should negate a tuple' do
      a = tuple(1, -2, 3, -4)

      expect(-a).to eq tuple(-1, 2, -3, 4)
    end
  end

  describe '#*' do
    it 'should multiply by a scalar' do
      a = tuple(1, -2, 3, -4)

      expect(a * 3.5).to eq tuple(3.5, -7, 10.5, -14)
    end

    it 'should multiply by a fraction' do
      a = tuple(1, -2, 3, -4)

      expect(a * 0.5).to eq tuple(0.5, -1, 1.5, -2)
    end
  end

  describe '#/' do
    it 'should divide a tuple by a scalar' do
      a = tuple(1, -2, 3, -4)

      expect(a / 2.0).to eq tuple(0.5, -1, 1.5, -2)
    end
  end
end

describe 'Vector' do
  describe '#magnitude' do
    it 'should compute the magnitude of various vectors' do
      expect(vector(1, 0, 0).magnitude).to eq 1
      expect(vector(0, 1, 0).magnitude).to eq 1
      expect(vector(0, 0, 1).magnitude).to eq 1
      expect(vector(1, 2, 3).magnitude).to eq Math.sqrt(14)
      expect(vector(-1, -2, -3).magnitude).to eq Math.sqrt(14)
    end
  end

  describe '#normalize' do
    it 'should normalize various vectors' do
      expect(vector(4, 0, 0).normalize).to eq vector(1, 0, 0)
      expect(vector(1, 2, 3).normalize).to eq vector(1/Math.sqrt(14),
                                                     2/Math.sqrt(14),
                                                     3/Math.sqrt(14))
    end

    it 'should make a vector with a magnitude of one' do
      expect(vector(1, 2, 3).normalize.magnitude).to eq 1
    end
  end

  describe '#dot' do
    it 'should compute the dot product of two tuples' do
      v1 = vector(1, 2, 3)
      v2 = vector(2, 3, 4)

      expect(v1.dot(v2)).to eq 20
    end
  end

  describe '#cross' do
    it 'should compute the cross product of two vectors' do
      a = vector(1, 2, 3)
      b = vector(2, 3, 4)

      expect(a.cross(b)).to eq vector(-1, 2, -1)
      expect(b.cross(a)).to eq vector(1, -2, 1)
    end
  end

  describe 'a complex operation' do
    it 'should compute an adition and mul and normalize' do
      velocity = vector(1, 1.8, 0).normalize * 11.25
      p = point(0, 1, 0) + velocity

      expect(p).to eq point(5.463482975759611, 10.834269356367301, 0)
    end
  end
end
