require_relative '../lib/color'
require_relative '../lib/intersection'
require_relative '../lib/light'
require_relative '../lib/material'
require_relative '../lib/math/matrix'
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
  purple_material = Material.new(color: color(0.7, 0.2, 0.8))
  sphere = Sphere.new(identity_matrix, purple_material)

  light_1 = PointLight.new(point(-10, 10, -10),
                           WHITE)
  light_2 = PointLight.new(point(10, -10, 10),
                           color(0.3, 0.3, 0.3))

  bg_color = color(0.5, 0.2, 0.1)

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
        hit = hit_from_intersections(xs)
        p = ray.position(hit.t)

        color_1 = hit.object.lighting(light_1, p, -ray.direction)
        color_2 = hit.object.lighting(light_2, p, -ray.direction)

        canvas.write_pixel(screen_x, screen_y, color_1 + color_2)
      else
        canvas.write_pixel(screen_x, screen_y, bg_color*((h-screen_y.to_f)/h))
      end
    end
  end

  printer = PpmCanvasPrinter.new(canvas)
  puts printer.lines
end

if __FILE__ == $0
  main
end
