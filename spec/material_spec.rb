require 'color'
require 'light'
require 'material'
require 'math/tuple'

describe 'Material' do
  before(:each) do
    @m = Material.new()
  end

  it 'has default values' do
    expect(@m.color).to eq WHITE
    expect(@m.ambient).to eq 0.1
    expect(@m.diffuse).to eq 0.9
    expect(@m.specular).to eq 0.9
    expect(@m.shininess).to eq 200
  end

  describe 'lighting' do
    before(:each) do
      @normal_vector = vector(0, 0, -1)
    end

    it 'is computed coming from behind' do
      eye_vector = vector(0, 0, -1)
      light = PointLight.new(point(0, 0, -10), WHITE)

      result = @m.lighting(light, NULL_POINT, eye_vector, @normal_vector)

      expect(result).to eq color(1.9, 1.9, 1.9)
    end

    it 'is computed looking at a 45° angle' do
      sqrt_2_div_by_2 = Math.sqrt(2)/2
      eye_vector = vector(0, sqrt_2_div_by_2, -sqrt_2_div_by_2)
      light = PointLight.new(point(0, 0, -10), WHITE)

      result = @m.lighting(light, NULL_POINT, eye_vector, @normal_vector)

      expect(result).to eq WHITE
    end

    it 'is computed coming from a 45° angle' do
      eye_vector = vector(0, 0, -1)
      light = PointLight.new(point(0, 10, -10), WHITE)

      result = @m.lighting(light, NULL_POINT, eye_vector, @normal_vector)

      expect(result).to eq_epsilon color(0.7364, 0.7364, 0.7364)
    end

    it 'is computed looking from the opposite side of the light' do
      sqrt_2_div_by_2 = Math.sqrt(2)/2
      eye_vector = vector(0, -sqrt_2_div_by_2, -sqrt_2_div_by_2)
      light = PointLight.new(point(0, 10, -10), WHITE)

      result = @m.lighting(light, NULL_POINT, eye_vector, @normal_vector)

      expect(result).to eq_epsilon color(1.6364, 1.6364, 1.6364)
    end

    it 'is computed when the light is behind the surface' do
      eye_vector = vector(0, 0, -1)
      light = PointLight.new(point(0, 0, 10), WHITE)

      result = @m.lighting(light, NULL_POINT, eye_vector, @normal_vector)

      expect(result).to eq color(0.1, 0.1, 0.1)
    end
  end
end
