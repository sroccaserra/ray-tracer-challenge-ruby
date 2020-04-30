Tuple = Struct.new(:x, :y, :z, :w)

def tuple(x, y, z, w)
  if w == 1.0
    point(x, y, z)
  else
    vector(x, y, z)
  end
end

class Point < Tuple
end

def point(x, y, z)
  Point.new(x, y, z, 1)
end

class Vector < Tuple
end

def vector(x, y, z)
  Vector.new(x, y, z, 0)
end

