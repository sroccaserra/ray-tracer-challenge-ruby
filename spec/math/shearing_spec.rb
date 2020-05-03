require_relative '../../lib/math/rtc_tuple'
require_relative '../../lib/math/shearing'

describe 'Shearings' do
  it 'should move x in proportion to y' do
    transform = shearing(1, 0, 0, 0, 0, 0)
    p = point(2, 3, 4)

    expect(transform*p).to eq point(5, 3, 4)
  end

  it 'should move x in proportion to z' do
    transform = shearing(0, 1, 0, 0, 0, 0)
    p = point(2, 3, 4)

    expect(transform*p).to eq point(6, 3, 4)
  end

  it 'should move y in proportion to x' do
    transform = shearing(0, 0, 1, 0, 0, 0)
    p = point(2, 3, 4)

    expect(transform*p).to eq point(2, 5, 4)
  end

  it 'should move y in proportion to z' do
    transform = shearing(0, 0, 0, 1, 0, 0)
    p = point(2, 3, 4)

    expect(transform*p).to eq point(2, 7, 4)
  end

  it 'should move z in proportion to x' do
    transform = shearing(0, 0, 0, 0, 1, 0)
    p = point(2, 3, 4)

    expect(transform*p).to eq point(2, 3, 6)
  end

  it 'should move z in proportion to y' do
    transform = shearing(0, 0, 0, 0, 0, 1)
    p = point(2, 3, 4)

    expect(transform*p).to eq point(2, 3, 7)
  end
end
