require 'color'
require 'material'

describe 'Material' do
  it 'has default values' do
    m = Material.new()

    expect(m.color).to eq WHITE
    expect(m.ambient).to eq 0.1
    expect(m.diffuse).to eq 0.9
    expect(m.specular).to eq 0.9
    expect(m.shininess).to eq 200
  end
end
