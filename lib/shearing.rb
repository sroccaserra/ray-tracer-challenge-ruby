require_relative './rtc_matrix'

def shearing(x_y, x_z, y_x, y_z, z_x, z_y)
  matrix(
    [1, x_y, x_z, 0],
    [y_x, 1, y_z, 0],
    [z_x, z_y, 1, 0],
    [0, 0, 0, 1],
  )
end
