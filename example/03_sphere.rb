require_relative '../lib/color'
require_relative '../lib/intersection'
require_relative '../lib/math/tuple'
require_relative '../lib/ray'
require_relative '../lib/render/canvas'
require_relative '../lib/render/ppm_canvas_printer'
require_relative '../lib/sphere'

def main
  w = 256
  h = 256
  canvas = Canvas.new(w, h)

  ray_origin = point(0, 0, -5)
  sphere = Sphere.new()

  wall_z = 10
  wall_size = 7.0
  half_size = wall_size/2

  pixel_width = wall_size/w
  pixel_height = wall_size/h

  h.times do
    |screen_y|
    world_y = half_size - pixel_height*screen_y
    w.times do
      |screen_x|
      world_x = -half_size + pixel_width*screen_x
      wall_position = point(world_x, world_y, wall_z)

      ray = Ray.new(ray_origin, (wall_position - ray_origin).normalize)

      xs = sphere.intersect(ray)

      if !xs.empty?
        pen_color = color(5-hit(xs).t, 0, 0)
        canvas.write_pixel(screen_x, screen_y, pen_color)
      end
    end
  end

  printer = PpmCanvasPrinter.new(canvas)
  puts printer.lines
end

if __FILE__ == $0
  main
end
