require 'math/translation'
require 'math/tuple'

describe 'Translations' do
  it 'translates a point' do
    transform = translation(5, -3, 2)
    p = point(-3, 4, 5)

    expect(transform*p).to eq point(2, 1, 7)
  end

  it 'translates a point in reverse when inversed' do
    transform = translation(5, -3, 2)
    p = point(-3, 4, 5)

    expect(transform.inverse*p).to eq point(-8, 7, 3)
  end

  it 'does not affect vectors' do
    transform = translation(5, -3, 2)
    v = vector(-3, 4, 5)

    expect(transform*v).to eq v
  end
end
