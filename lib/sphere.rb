require_relative './math/matrix'
require_relative './intersection'

class Sphere
  def initialize(transformation = identity_matrix)
    @transformation = transformation
  end

  def intersect(ray)
    transformed_ray = ray.transform(@transformation.inverse)
    sphere_to_ray_vector = transformed_ray.origin - point(0, 0, 0)
    a = transformed_ray.direction.dot(transformed_ray.direction)
    b = 2*transformed_ray.direction.dot(sphere_to_ray_vector)
    c = sphere_to_ray_vector.dot(sphere_to_ray_vector) - 1
    delta = b.abs2 - 4*a*c

    if delta < 0
      []
    else
      sqrt_delta = Math.sqrt(delta)
      t1 = (-b - sqrt_delta)/(2*a)
      t2 = (-b + sqrt_delta)/(2*a)
      [Intersection.new(t1, self), Intersection.new(t2, self)]
    end
  end
end
