require 'matrix'

def tuple(x, y, z, w)
  if w == 1.0
    point(x, y, z)
  else
    vector(x, y, z)
  end
end

def point(x, y, z)
  RayTracer::Point.new(Vector[x, y, z], 1)
end

def vector(x, y, z)
  RayTracer::Vector.new(Vector[x, y, z], 0)
end

module RayTracer
  Tuple = Struct.new(:v, :w) do
    def x
      v[0]
    end

    def y
      v[1]
    end

    def z
      v[2]
    end
  end

  class Point < Tuple
    def +(other)
      other.addPoint(self)
    end

    def -(other)
      other.substractFromPoint(self)
    end

    def substractFromPoint(other)
      Vector.new(other.v - self.v, 0)
    end
  end

  class Vector < Tuple
    def +(other)
      other.addVector(self)
    end

    def addPoint(p)
      Point.new(self.v + p.v, 1)
    end

    def addVector(other)
      Vector.new(self.v + other.v, 0)
    end

    def substractFromPoint(other)
      Point.new(other.v - self.v, 1)
    end
  end
end
