require 'math/matrix'
require 'math/rtc_tuple'

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

  describe 'Determinant of a 2x2 matrix' do
    it 'should compute for a 2x2 matrix' do
      a = matrix(
        [1, 5],
        [-3, 2]
      )

      expect(a.determinant).to be 17
    end
  end

  describe 'Submatrixes' do
    it 'should remove a row and a column from a 3x3 matrix' do
      a = matrix(
        [1, 5, 0],
        [-3, 2, 7],
        [0, 6, -3],
      )

      expect(a.submatrix(0, 2)).to eq matrix([-3, 2], [0, 6])
    end

    it 'should remove a row and a columt from a 4x4 matrix' do
      a = matrix(
        [-6, 1, 1, 6],
        [-8, 5, 8, 6],
        [-1, 0, 8, 2],
        [-7, 1, -1, 1],
      )

      expect(a.submatrix(2, 1)).to eq matrix(
        [-6, 1, 6],
        [-8, 8, 6],
        [-7, -1, 1]
      )
    end
  end

  describe 'Minors' do
    it 'should compute the minor of a 3x3 matrix' do
      a = matrix(
        [3, 5, 0],
        [2, -1, -7],
        [6, -1, 5],
      )

      expect(a.minor(1, 0)).to be 25
    end
  end

  describe 'Cofactors' do
    it 'should compute the cofactors of a 3x3 matrix' do
      a = matrix(
        [3, 5, 0],
        [2, -1, -7],
        [6, -1, 5],
      )

      expect(a.cofactor(0, 0)).to be(-12)
      expect(a.cofactor(1, 0)).to be(-25)
    end
  end

  describe 'Determinant of larger matrix' do
    it 'should compute the determinant of a 3x3 matrix' do
      a = matrix(
        [1, 2, 6],
        [-5, 8, -4],
        [2, 6, 4],
      )

      expect(a.cofactor(0, 0)).to be 56
      expect(a.cofactor(0, 1)).to be 12
      expect(a.cofactor(0, 2)).to be(-46)
      expect(a.determinant).to be(-196)
    end

    it 'should compute the determinant of a 4x4 matrix' do
      a = matrix(
        [-2, -8, 3, 5],
        [-3, 1, 7, 3],
        [1, 2, -9, 6],
        [-6, 7, 7, -9],
      )

      expect(a.cofactor(0, 0)).to be 690
      expect(a.cofactor(0, 1)).to be 447
      expect(a.cofactor(0, 2)).to be 210
      expect(a.cofactor(0, 3)).to be 51
      expect(a.determinant).to be(-4071)
    end
  end

  describe 'Matrix inversion' do
    it 'should compute the inverse of a 4x4 matrix' do
      a = matrix(
        [-5, 2, 6, -8],
        [1, -5, 1, 8],
        [7, 7, -6, -7],
        [1, -3, 7, 4],
      )

      b = a.inverse

      expect(a.determinant).to eq 532
      expect(a.cofactor(2, 3)).to eq(-160)
      expect(b[3, 2]).to eq(-160.0/532)
      expect(a.cofactor(3, 2)).to eq 105
      expect(b[2, 3]).to eq 105.0/532
      expect(b).to eq matrix(
        [Rational(29,133), Rational(60,133), Rational(32,133), Rational(-6,133)],
        [Rational(-215,266), Rational(-775,532), Rational(-59,133), Rational(277,532)],
        [Rational(-3,38), Rational(-17,76), Rational(-1,19), Rational(15,76)],
        [Rational(-139,266), Rational(-433,532), Rational(-40,133), Rational(163,532)],
      )
    end

    it 'should compute the inverse of another matrix' do
      a = matrix(
        [8, -5, 9, 2],
        [7, 5, 6, 1],
        [-6, 0, 9, 6],
        [-3, 0, -9, -4],
      )

      expect(a.inverse).to eq matrix(
        [Rational(-2,13), Rational(-2,13), Rational(-11,39), Rational(-7,13)],
        [Rational(-1,13), Rational(8,65), Rational(1,39), Rational(2,65)],
        [Rational(14,39), Rational(14,39), Rational(17,39), Rational(12,13)],
        [Rational(-9,13), Rational(-9,13), Rational(-10,13), Rational(-25,13)],
      )
    end

    it 'should compute the inverse of a third matrix' do
      a = matrix(
        [9, 3, 0, 9],
        [-5, -2, -6, -3],
        [-4, 9, 6, 4],
        [-7, 6, 6, 2],
      )

      expect(a.inverse).to eq matrix(
        [Rational(-11,270), Rational(-7,90), Rational(13,90), Rational(-2,9)],
        [Rational(-7,90), Rational(1,30), Rational(11,30), Rational(-1,3)],
        [Rational(-47,1620), Rational(-79,540), Rational(-59,540), Rational(7,54)],
        [Rational(8,45), Rational(1,15), Rational(-4,15), Rational(1,3)],
      )
    end

    describe 'Multiplying A*B by the inverse of B' do
      it 'should return A' do
        a = matrix(
          [3, -9, 7, 3],
          [3, -8, 2, -9],
          [-4, 4, 4, 1],
          [-6, 5, -1, 1]
        )
        b = matrix(
          [8, 2, 2, 2],
          [3, -1, 7, 0],
          [7, 0, 5, 4],
          [6, -2, 0, 5],
        )
        c = a*b

        expect(c*b.inverse).to eq a
      end
    end
  end
end
