require 'math/scaling'
require 'math/tuple'

describe 'Scaling' do
  it 'scales a point' do
    transform = scaling(2, 3, 4)
    p = point(-4, 6, 8)

    expect(transform*p).to eq point(-8, 18, 32)
  end

  it 'scales a vector' do
    transform = scaling(2, 3, 4)
    v = vector(-4, 6, 8)

    expect(transform*v).to eq vector(-8, 18, 32)
  end

  it 'scales in reverse when inversed' do
    transform = scaling(2, 3, 4)
    v = vector(-4, 6, 8)

    expect(transform.inverse*v).to eq vector(-2, 2, 2)
  end

  it 'is a reflection when negated' do
    transform = scaling(-1, 1, 1)
    p = point(2, 3, 4)

    expect(transform*p).to eq point(-2, 3, 4)
  end
end
