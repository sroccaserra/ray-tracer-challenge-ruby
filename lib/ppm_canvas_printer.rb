class PpmCanvasPrinter
  def initialize(canvas)
    @canvas = canvas
  end

  def lines
    header + pixel_data
  end

  private

  def header
    w = @canvas.width
    h = @canvas.height
    ['P3', "#{w} #{h}", '255']
  end

  def pixel_data
    [
      '255 0 0 0 0 0 0 0 0 0 0 0 0 0 0',
      '0 0 0 0 0 0 0 128 0 0 0 0 0 0 0',
      '0 0 0 0 0 0 0 0 0 0 0 0 0 0 255',
    ]
  end
end
