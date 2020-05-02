require_relative '../lib/rtc_tuple'
require_relative '../lib/rotation'

describe 'Rotations' do
  describe 'Along the x axis' do
    it 'should allow rotation' do
      p = point(0, 1, 0)
      half_quarter = rotation_x(Math::PI/4)
      full_quarter = rotation_x(Math::PI/2)

      expect((half_quarter*p -
              point(0, Math.sqrt(2)/2, Math.sqrt(2)/2)).magnitude)
        .to be < EPSILON
      expect((full_quarter*p -
              point(0, 0, 1)).magnitude)
        .to be < EPSILON
    end

    it 'should rotate in other direction when inversed' do
      p = point(0, 1, 0)
      half_quarter = rotation_x(Math::PI/4)

      expect((half_quarter.inverse*p -
              point(0, Math.sqrt(2)/2, -Math.sqrt(2)/2)).magnitude)
        .to be < EPSILON
    end
  end
end
