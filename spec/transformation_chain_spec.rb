require_relative '../lib/rotation'
require_relative '../lib/rtc_tuple'
require_relative '../lib/scaling'
require_relative '../lib/translation'

describe 'Chaining transformations' do
  before(:each) do
    @a = rotation_x(Math::PI/2)
    @b = scaling(5, 5, 5)
    @c = translation(10, 5, 7)
  end

  it 'applies in sequence' do
    p1 = point(1, 0, 1)

    p2 = @a*p1
    p3 = @b*p2
    p4 = @c*p3

    expect(p2).to eq_epsilon point(1, -1, 0)
    expect(p3).to eq_epsilon point(5, -5, 0)
    expect(p4).to eq_epsilon point(15, 0, 7)
  end

  it 'multiplies in reverse order' do
    p = point(1, 0, 1)
    transformation = @c*@b*@a

    expect(transformation*p).to eq_epsilon point(15, 0, 7)
  end
end
