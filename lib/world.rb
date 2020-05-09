class World
  def initialize
    @shapes = []
  end

  def set_light(a_light)
    @light = a_light
  end

  def add_shape(a_shape)
    @shapes << a_shape
  end

  def intersect_with(a_ray)
    @shapes.flat_map { |shape| shape.intersect(a_ray) }
      .sort_by!(&:t)
  end
end
