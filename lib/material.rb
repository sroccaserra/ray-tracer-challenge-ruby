require_relative './color'

class Material
  attr_reader :color, :ambient, :diffuse, :specular, :shininess

  def initialize(
    color: WHITE,
    ambient: 0.1,
    diffuse: 0.9,
    specular: 0.9,
    shininess: 200
  )
    @color = color
    @ambient = ambient
    @diffuse = diffuse
    @specular = specular
    @shininess = shininess
  end

  def lighting(light, point, eye_vector, normal_vector)
    effective_color = @color.mul(light.intensity)

    light_vector = light.direction_to(point)
    light_dot_normal = light_vector.dot(normal_vector)
    if light_dot_normal < 0
      diffuse_color = BLACK
      specular_color = BLACK
    else
      diffuse_color = effective_color * (@diffuse * light_dot_normal)
      reflect_vector = -light_vector.reflect_on(normal_vector)
      reflect_dot_eye = reflect_vector.dot(eye_vector)
      if reflect_dot_eye <= 0
        specular_color = BLACK
      else
        factor = reflect_dot_eye**@shininess
        specular_color = light.intensity*(@specular*factor)
      end
    end

    ambient_color = effective_color * @ambient
    ambient_color + diffuse_color + specular_color
  end
end
