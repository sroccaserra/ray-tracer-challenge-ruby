Ray = Struct.new(:origin, :direction) do
  def position(t)
    origin+direction*t
  end

  def transform(m)
    Ray.new(m*origin, m*direction)
  end
end
