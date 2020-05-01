MAX_PPM_LINE_SIZE = 70

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
      ints = pixel_row_to_ints(pixel_row)
      line = ""
      ints.each do
        |int|
        int_string = int.to_s
        delim = line.empty? ? "" : " "
        if line.size + delim.size + int_string.size > MAX_PPM_LINE_SIZE
          lines << line
          line = int_string
        else
          line << delim + int_string
        end
      end
      lines << line
    end
    lines
  end

  def pixel_row_to_ints(pixel_row)
    pixel_row.flat_map do
      |pixel|
      pixel_to_ints(pixel)
    end
  end

  def pixel_to_ints(pixel)
    return [0, 0, 0] if pixel.nil?
    pixel.v.to_a.map { |x| float_value_to_0_255(x) }
  end

  def float_value_to_0_255(x)
    (x*255).clamp(0, 255).round
  end
end
