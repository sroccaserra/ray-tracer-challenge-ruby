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
end
