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
  Tuple = Struct.new(:v, :w)

  class Tuple
    def x
      v[0]
    end
    def y
      v[1]
    end
    def z
      v[2]
    end

    def +(other)
      Point.new(self.v + other.v, 1)
    end
  end

  class Point < Tuple
  end

  class Vector < Tuple
  end
end
