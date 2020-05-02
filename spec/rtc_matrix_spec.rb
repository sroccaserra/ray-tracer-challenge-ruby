require_relative '../lib/rtc_matrix'
require_relative '../lib/rtc_tuple'

describe 'RayTracerChallenge::Matrix' do
  it 'should be queryable' do
    m = matrix(
      [1, 2, 3, 4],
      [5.5, 6.5, 7.5, 8.5],
      [9, 10, 11, 12],
      [13.5, 14.5, 15.5, 16.5],
    )

    expect(m[0, 0]).to be 1
    expect(m[0, 3]).to be 4
    expect(m[1, 0]).to be 5.5
    expect(m[1, 2]).to be 7.5
    expect(m[2, 2]).to be 11
    expect(m[3, 0]).to be 13.5
    expect(m[3, 2]).to be 15.5
  end

  it 'should allow 2x2 dimensions' do
    m = matrix(
      [-3, 5],
      [1 , -2],
    )

    expect(m[0,0]).to be(-3)
    expect(m[0,1]).to be 5
    expect(m[1,0]).to be 1
    expect(m[1,1]).to be(-2)
  end

  it 'should allow 3x3 dimensions' do
    m = matrix(
      [-3, 5, 0],
      [1 , -2, -7],
      [0 , 1, 1],
    )

    expect(m[0,0]).to be(-3)
    expect(m[1,1]).to be(-2)
    expect(m[2,2]).to be 1
  end

  describe 'matrix comparison' do
    it 'should be equal' do
      a = matrix(
        [1, 2, 3, 4],
        [5, 6, 7, 8],
        [9, 8, 7, 6],
        [5, 4, 3, 2],
      )
      b = matrix(
        [1, 2, 3, 4],
        [5, 6, 7, 8],
        [9, 8, 7, 6],
        [5, 4, 3, 2],
      )

      expect(a).to eq b
    end

    it 'should be different' do
      a = matrix(
        [1, 2, 3, 4],
        [5, 6, 7, 8],
        [9, 8, 7, 6],
        [5, 4, 3, 2],
      )
      b = matrix(
        [2, 3, 4, 5],
        [6, 7, 8, 9],
        [8, 7, 6, 5],
        [4, 3, 2, 1],
      )

      expect(a).not_to eq b
    end
  end

  describe 'Multiplication' do
    it 'should multiply by another matrix' do
      a = matrix(
        [1, 2, 3, 4],
        [5, 6, 7, 8],
        [9, 8, 7, 6],
        [5, 4, 3, 2],
      )
      b = matrix(
        [-2, 1, 2, 3],
        [3, 2, 1, -1],
        [4, 3, 6, 5],
        [1, 2, 7, 8],
      )

      expect(a*b).to eq matrix(
        [20, 22, 50, 48],
        [44, 54, 114, 108],
        [40, 58, 110, 102],
        [16, 26, 46, 42],
      )
    end

    it 'should multiply by a tuple' do
      a = matrix(
        [1, 2, 3, 4],
        [2, 4, 4, 2],
        [8, 6, 4, 1],
        [0, 0, 0, 1],
      )
      b = tuple(1, 2, 3, 1)

      expect(a*b).to eq tuple(18, 24, 33, 1)
    end
  end

  describe 'Identity matrix' do
    it 'should leave a matrix unchanged after multiplication' do
      a = matrix(
        [0, 1, 2, 4],
        [1, 2, 4, 8],
        [2, 4, 8, 16],
        [4, 8, 16, 32],
      )

      expect(a*identity_matrix).to eq a
    end

    it 'should leave a tuple unchanged after multiplication' do
      a = tuple(1, 2, 3, 4)

      expect(identity_matrix*a).to eq a
    end
  end

  describe 'Transposition' do
    it 'should transpose a matrix' do
      a = matrix(
        [0, 9, 3, 0],
        [9, 8, 0, 8],
        [1, 8, 5, 3],
        [0, 0, 5, 8],
      )

      expect(a.transpose).to eq matrix(
        [0, 9, 1, 0],
        [9, 8, 8, 0],
        [3, 0, 5, 5],
        [0, 8, 3, 8],
      )
    end

    it 'should leave the identity_matrix unchanged' do
      expect(identity_matrix.transpose).to eq identity_matrix
    end
  end

  describe 'Determinant' do
    it 'should compute for a 2x2 matrix' do
      a = matrix(
        [1, 5],
        [-3, 2]
      )

      expect(a.determinant).to be 17
    end
  end
end
