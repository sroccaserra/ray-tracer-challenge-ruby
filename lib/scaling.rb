require_relative './rtc_matrix'

def scaling(x, y, z)
  matrix(
    [x, 0, 0, 0],
    [0, y, 0, 0],
    [0, 0, z, 0],
    [0, 0, 0, 1],
  )
end
