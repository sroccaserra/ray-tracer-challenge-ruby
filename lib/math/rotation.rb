require_relative './matrix'

def rotation_x(r)
  matrix(
    [1, 0, 0, 0],
    [0, Math.cos(r), -Math.sin(r), 0],
    [0, Math.sin(r), Math.cos(r), 0],
    [0, 0, 0, 1],
  )
end

def rotation_y(r)
  matrix(
    [Math.cos(r), 0, Math.sin(r), 0],
    [0, 1, 0, 0],
    [-Math.sin(r), 0, Math.cos(r), 0],
    [0, 0, 0, 1],
  )
end

def rotation_z(r)
  matrix(
    [Math.cos(r), -Math.sin(r), 0, 0],
    [Math.sin(r), Math.cos(r), 0, 0],
    [0, 0, 1, 0],
    [0, 0, 0, 1],
  )
end
