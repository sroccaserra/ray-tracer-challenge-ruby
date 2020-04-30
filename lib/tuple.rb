def tuple(x, y, z, w)
  if w == 1.0
    Point.new(x, y, z, w)
  else
    Vector.new(x, y, z, w)
  end
end

def point(x, y, z)
  Point.new(x, y, z, 1)
end

Tuple = Struct.new(:x, :y, :z, :w)

class Point < Tuple
end

class Vector < Tuple
end
