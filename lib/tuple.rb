require 'matrix'

def tuple(x, y, z, w)
  Tuple[x, y, z, w]
end

def point(x, y, z)
  tuple(x, y, z, 1)
end

def vector(x, y, z)
  tuple(x, y, z, 0)
end

class Tuple < Vector
  def x
    self[0]
  end

  def y
    self[1]
  end

  def z
    self[2]
  end

  def w
    self[3]
  end

  def is_point?
    w == 1
  end

  def is_vector?
    w == 0
  end

  def cross(other)
    Tuple[
      self[1]*other[2] - self[2]*other[1],
      self[2]*other[0] - self[0]*other[2],
      self[0]*other[1] - self[1]*other[0],
      0
    ]
  end
end
