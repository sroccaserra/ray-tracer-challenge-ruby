require 'color'
require 'light'
require 'math/matrix'
require 'math/scaling'
require 'math/tuple'
require 'ray'
require 'sphere'
require 'world'

describe 'World' do
  it 'intersects with a ray' do
    s_1 = Sphere.new(identity_matrix, Material.new(
      color: color(0.8, 1.0, 0.6),
      diffuse: 0.7,
      specular: 0.2
    ))
    s_2 = Sphere.new(scaling(0.5, 0.5, 0.5))

    world = World.new()
    world.set_light(PointLight.new(point(-10, 10, -10), WHITE))
    world.add_shape(s_1)
    world.add_shape(s_2)

    ray = Ray.new(point(0, 0, -5), vector(0, 0, 1))

    xs = world.intersect_with(ray)

    expect(xs.map(&:t)).to eq [4, 4.5, 5.5, 6]
  end
end
