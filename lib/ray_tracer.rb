require 'matrix'

def tuple(x, y, z, w)
  case w
  when 1.0
    point(x, y, z)
  when 0
    vector(x, y, z)
  else
    RayTracer::Tuple.new(Vector[x, y, z], w)
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

    def -@
      Tuple.new(-v, -w)
    end

    def *(scalar)
      Tuple.new(v*scalar, w*scalar)
    end

    def /(scalar)
      Tuple.new(v/scalar, w/scalar)
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

    def -(other)
      other.substractFromVector(self)
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

    def substractFromVector(other)
      Vector.new(other.v - self.v, 0)
    end

    def magnitude
      v.magnitude
    end

    def normalize
      Vector.new(v.normalize, 0)
    end

    def dot(other)
      self.v.dot(other.v)
    end

    def cross(other)
      Vector.new(self.v.cross(other.v), 0)
    end
  end
end
