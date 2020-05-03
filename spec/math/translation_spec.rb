require_relative '../../lib/math/rtc_tuple'
require_relative '../../lib/math/translation'

describe 'Translations' do
  it 'should translate a point' do
    transform = translation(5, -3, 2)
    p = point(-3, 4, 5)

    expect(transform*p).to eq point(2, 1, 7)
  end

  it 'should translate a point in reverse when inversed' do
    transform = translation(5, -3, 2)
    p = point(-3, 4, 5)

    expect(transform.inverse*p).to eq point(-8, 7, 3)
  end

  it 'should not affect vectors' do
    transform = translation(5, -3, 2)
    v = vector(-3, 4, 5)

    expect(transform*v).to eq v
  end
end
