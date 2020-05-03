require_relative './lib/render/canvas'
require_relative './lib/render/ppm_canvas_printer'
require_relative './lib/rotation'
require_relative './lib/rtc_color'
require_relative './lib/rtc_tuple'
require_relative './lib/scaling'
require_relative './lib/translation'

def main
  w = 128
  h = 128
  canvas = Canvas.new(w, h)
  pen_color = color(0.5, 1, 0)

  p = point(0, 0, 1)
  to_screen_transform = translation(w/2, 0, h/2)*scaling(0.4*h, 1, 0.4*h)
  12.times do
    |i|
    r = rotation_y(i*Math::PI/6)
    dot = to_screen_transform*r*p
    canvas.write_pixel(dot.x.floor, dot.z.floor, pen_color)
  end

  printer = PpmCanvasPrinter.new(canvas)
  puts printer.lines
end

if __FILE__ == $0
  main
end
