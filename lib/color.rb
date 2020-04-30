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
end
