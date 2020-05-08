require_relative './math/matrix'
require_relative './math/tuple'
require_relative './intersection'
require_relative './material'

class Sphere
  def initialize(transformation = identity_matrix, material = Material.new)
    @transformation = transformation
    @material = material
  end

  def intersect(ray)
    transformed_ray = ray.transform(@transformation.inverse)
    sphere_to_ray_vector = transformed_ray.origin - NULL_POINT
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

  def normal_at(world_p)
    object_p = @transformation.inverse*world_p
    object_n = (object_p - NULL_POINT)
    world_n = @transformation.inverse.transpose*object_n
    vector(world_n.x, world_n.y, world_n.z).normalize
  end

  def lighting(light, point, eye_vector)
    normal = normal_at(point)
    @material.lighting(light, point, eye_vector, normal)
  end
end
