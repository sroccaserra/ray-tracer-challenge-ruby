require 'matrix'

def tuple(x, y, z, w)
  Tuple.new(Vector[x, y, z], w)
end

def point(x, y, z)
  Tuple.new(Vector[x, y, z], 1)
end

def vector(x, y, z)
  Tuple.new(Vector[x, y, z], 0)
end

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

  def is_point?
    w == 1
  end

  def is_vector?
    w == 0
  end

  def +(other)
    Tuple.new(self.v + other.v, self.w + other.w)
  end

  def -(other)
    Tuple.new(self.v - other.v, self.w - other.w)
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

  def magnitude
    v.magnitude
  end

  def normalize
    Tuple.new(v.normalize, 0)
  end

  def dot(other)
    self.v.dot(other.v)
  end

  def cross(other)
    Tuple.new(self.v.cross(other.v), 0)
  end
end
