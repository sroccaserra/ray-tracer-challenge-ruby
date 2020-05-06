require 'matrix'

def tuple(x, y, z, w)
  Tuple.new(Vector[x, y, z, w])
end

def point(x, y, z)
  tuple(x, y, z, 1)
end

def vector(x, y, z)
  tuple(x, y, z, 0)
end

Tuple = Struct.new(:vector) do
  def x
    vector[0]
  end

  def y
    vector[1]
  end

  def z
    vector[2]
  end

  def w
    vector[3]
  end

  def is_point?
    w == 1
  end

  def is_vector?
    w == 0
  end

  def +(other)
    Tuple.new(vector+other.vector)
  end

  def -(other)
    Tuple.new(vector-other.vector)
  end

  def -@
    Tuple.new(-vector)
  end

  def *(scalar)
    Tuple.new(vector*scalar)
  end

  def /(scalar)
    Tuple.new(vector/scalar)
  end

  def magnitude
    vector.magnitude
  end

  def normalize
    Tuple.new(vector.normalize)
  end

  def dot(other)
    vector.dot(other.vector)
  end

  def cross(other)
    Tuple.new(Vector[
      vector[1]*other.vector[2] - vector[2]*other.vector[1],
      vector[2]*other.vector[0] - vector[0]*other.vector[2],
      vector[0]*other.vector[1] - vector[1]*other.vector[0],
      0
    ])
  end
end

NULL_POINT = point(0, 0, 0).freeze
NULL_VECTOR = vector(0, 0, 0).freeze
