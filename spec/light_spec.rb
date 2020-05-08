require 'color'
require 'light'
require 'math/tuple'

describe 'PointLight' do
  it 'has a pisition and intensity' do
    intensity = WHITE
    light = PointLight.new(NULL_POINT, intensity)

    expect(light.position).to eq NULL_POINT
    expect(light.intensity).to eq intensity
  end
end
