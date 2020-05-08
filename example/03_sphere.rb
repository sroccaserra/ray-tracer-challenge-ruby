require_relative '../lib/color'
require_relative '../lib/intersection'
require_relative '../lib/math/tuple'
require_relative '../lib/ray'
require_relative '../lib/render/canvas'
require_relative '../lib/render/ppm_canvas_printer'
require_relative '../lib/sphere'

def main
  w = 256
  h = w
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
        depth_ratio = 4.9-hit_from_intersections(xs).t
        gradiant_g = (screen_x.to_f)*(h-screen_y)/(w*h)
        gradiant_b = screen_x.to_f*screen_y/(w*h)
        pen_color = color(depth_ratio, gradiant_g, gradiant_b)
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
