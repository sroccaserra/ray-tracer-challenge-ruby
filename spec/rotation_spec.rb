require_relative '../lib/rtc_tuple'
require_relative '../lib/rotation'

describe 'Rotations' do
  describe 'Along the x axis' do
    it 'should allow rotation' do
      p = point(0, 1, 0)
      half_quarter = rotation_x(Math::PI/4)
      full_quarter = rotation_x(Math::PI/2)

      expect(half_quarter*p).to eq_epsilon point(0, Math.sqrt(2)/2, Math.sqrt(2)/2)
      expect(full_quarter*p).to eq_epsilon point(0, 0, 1)
    end

    it 'should rotate in other direction when inversed' do
      p = point(0, 1, 0)
      half_quarter = rotation_x(Math::PI/4)

      expect(half_quarter.inverse*p).to eq_epsilon point(0, Math.sqrt(2)/2, -Math.sqrt(2)/2)
    end
  end
end
