class PpmCanvasPrinter
  def initialize(canvas)
    @canvas = canvas
  end

  def lines
    w = @canvas.width
    h = @canvas.height
    ['P3', "#{w} #{h}", '255', 'garbage']
  end
end
