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
    lines = []
    @canvas.rows.each do
      |pixel_row|
      ints = pixel_row.flat_map do
        |pixel|
        pixel_to_ints(pixel)
      end
      line = ""
      ints.each do
        |int|
        text = int.to_s
        delim = line.empty? ? "" : " "
        if line.size + delim.size + text.size > 70
          lines << line
          line = text
        else
          line = line + delim + text
        end
      end
      lines << line
    end
    lines
  end

  def pixel_to_ints(pixel)
    return [0, 0, 0] if pixel.nil?
    pixel.v.to_a.map { |x| float_value_to_0_255(x) }
  end

  def float_value_to_0_255(x)
    (x*255).clamp(0, 255).round
  end
end
