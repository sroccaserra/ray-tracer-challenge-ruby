require_relative 'lib/canvas'
require_relative 'lib/tuple'
require_relative 'lib/color'
require_relative 'lib/ppm_canvas_printer'

def main
  c = Canvas.new(900, 550)

  gravity = vector(0, -0.1, 0)
  wind = vector(-0.01, 0, 0)
  start = point(0, 1, 0)
  velocity = vector(1, 1.8, 0).normalize * 11.25

  environment = Environment.new(gravity, wind)
  projectile = Projectile.new(environment, start, velocity)

  c.write_pixel(projectile.x, projectile.y, color(1, 0, 0))

  printer = PpmCanvasPrinter.new(c)
  puts printer.lines
end

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

Environment = Struct.new(:gravity, :wind)

if __FILE__ == $0
  main
end
