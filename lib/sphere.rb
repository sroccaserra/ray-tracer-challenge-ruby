require_relative './intersection'

class Sphere
  def initialize(center, radius)
    @center = center
    @radius = radius
  end

  def intersect(ray)
    sphere_to_ray_vector = ray.origin - point(0, 0, 0)
    b = 2*ray.direction.normalize.dot(sphere_to_ray_vector)
    c = sphere_to_ray_vector.dot(sphere_to_ray_vector) - 1
    delta = b.abs2 - 4*c

    if delta < 0
      []
    else
      sqrt_delta = Math.sqrt(delta)
      t1 = (-b - sqrt_delta)/2
      t2 = (-b + sqrt_delta)/2
      [Intersection.new(t1, self), Intersection.new(t2, self)]
    end
  end
end
