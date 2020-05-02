require 'matrix'

describe 'Matrix' do
  it 'should be queryable' do
    m = Matrix[
      [1, 2, 3, 4],
      [5.5, 6.5, 7.5, 8.5],
      [9, 10, 11, 12],
      [13.5, 14.5, 15.5, 16.5],
    ]

    expect(m[0, 0]).to be 1
    expect(m[0, 3]).to be 4
    expect(m[1, 0]).to be 5.5
    expect(m[1, 2]).to be 7.5
    expect(m[2, 2]).to be 11
    expect(m[3, 0]).to be 13.5
    expect(m[3, 2]).to be 15.5
  end

  it 'should allow 2x2 dimensions' do
    m = Matrix[
      [-3, 5],
      [1 , -2],
    ]

    expect(m[0,0]).to be(-3)
    expect(m[0,1]).to be 5
    expect(m[1,0]).to be 1
    expect(m[1,1]).to be(-2)
  end

  it 'should allow 3x3 dimensions' do
    m = Matrix[
      [-3, 5, 0],
      [1 , -2, -7],
      [0 , 1, 1],
    ]

    expect(m[0,0]).to be(-3)
    expect(m[1,1]).to be(-2)
    expect(m[2,2]).to be 1
  end
end
