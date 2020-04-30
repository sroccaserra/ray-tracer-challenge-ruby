require_relative '../lib/tuple.rb'

describe 'Tuples' do
  describe 'A tuple with w=1.0' do
    it 'should be a point'do 
      a = Tuple.new(4.3, -4.2, 3.1, 1.0)
      expect(a.x).to eq 4.3
      expect(a.y).to eq(-4.2)
      expect(a.z).to eq 3.1
      expect(a.w).to eq 1.0
    end
  end
end
