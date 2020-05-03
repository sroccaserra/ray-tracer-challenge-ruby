require_relative './lib/color'
require_relative './lib/math/rtc_tuple'
require_relative './lib/render/canvas'
require_relative './lib/render/ppm_canvas_printer'

def main
  gravity = vector(0, -0.1, 0)
  wind = vector(-0.01, 0, 0)
  start = point(0, 1, 0)
  velocity = vector(1, 1.8, 0).normalize * 11.25

  environment = Environment.new(gravity, wind)
  projectile = Projectile.new(environment, start, velocity)

  w = 900
  h = 550
  canvas = Canvas.new(w, h)
  pen_color = color(1, 0.5, 0)
  while projectile.y >= 0
    canvas.write_pixel(projectile.x.floor, h - projectile.y.floor, pen_color)
    projectile.tick
  end

  printer = PpmCanvasPrinter.new(canvas)
  puts printer.lines
end

Environment = Struct.new(:gravity, :wind)

class Projectile
  def initialize(environment, position, velocity)
    @environment = environment
    @position = position
    @velocity = velocity
  end

  def tick
    @position = @position + @velocity
    @velocity = @velocity + @environment.gravity + @environment.wind
  end

  def x
    @position.x
  end

  def y
    @position.y
  end
end

if __FILE__ == $0
  main
end
