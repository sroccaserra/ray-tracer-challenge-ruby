class Canvas
  attr_reader :width, :height

  def initialize(w, h)
    @width = w
    @height = h
    @pixels = Array.new(w*h, nil)
  end

  def is_blank?
    @pixels.all? { |p| p.nil? }
  end

  def write_pixel(x, y, color)
    @pixels[x + y*width] = color
  end

  def pixel_at(x, y)
    @pixels[x + y*width]
  end

  def rows
    (0...@height).map do
      |row_number|
      offset = @width*row_number
      @pixels[offset...offset+@width]
    end
  end
end
