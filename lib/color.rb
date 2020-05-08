require 'matrix'

def color(red, green, blue)
  Color.new(Vector[red, green, blue])
end

Color = Struct.new(:v) do
  def red
    v[0]
  end

  def green
    v[1]
  end

  def blue
    v[2]
  end

  def +(other)
    Color.new(self.v + other.v)
  end

  def -(other)
    Color.new(self.v - other.v)
  end

  def *(scalar)
    Color.new(self.v*scalar)
  end

  def mul(other)
    red = v[0]*other.v[0]
    green = v[1]*other.v[1]
    blue = v[2]*other.v[2]
    Color.new(Vector[red, green, blue])
  end
end

BLACK = color(0, 0, 0)
WHITE = color(1, 1, 1)
