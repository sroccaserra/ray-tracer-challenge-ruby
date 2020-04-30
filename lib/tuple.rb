def tuple(x, y, z, w)
  if w == 1.0
    Point.new(x, y, z, w)
  else
    Vector.new(x, y, z, w)
  end
end

class Tuple
  attr_reader :x, :y, :z, :w

  def initialize(x, y, z, w)
    @x = x
    @y = y
    @z = z
    @w = w
  end
end

class Point < Tuple
end

class Vector < Tuple
end
