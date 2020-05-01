class PpmCanvasPrinter
  def initialize(canvas)
    @canvas = canvas
  end

  def lines
    header_lines + pixel_data_lines
  end

  private

  def header_lines
    w = @canvas.width
    h = @canvas.height
    ['P3', "#{w} #{h}", '255']
  end

  def pixel_data_lines
    @canvas.rows.map do
      |pixel_row|
      pixel_row.map { |p| pixel_to_string(p) }.join(' ')
    end
  end

  def pixel_to_string(pixel)
    return '0 0 0' if pixel.nil?
    pixel.v.to_a.map { |x| float_value_to_0_255(x) }.join(' ')
  end

  def float_value_to_0_255(x)
    (x*255).clamp(0, 255).round
  end
end
