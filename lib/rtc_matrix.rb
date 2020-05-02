require 'matrix'

require_relative './rtc_tuple'

def matrix(*rows)
  RayTracerChallenge::Matrix.new(::Matrix.rows(rows))
end

def identity_matrix
  RayTracerChallenge::Matrix.new(::Matrix.identity(4))
end

module RayTracerChallenge
  Matrix = Struct.new(:matrix) do
    def [](i, j)
      matrix[i, j]
    end

    def *(other)
      if other.is_a?(Tuple)
        Tuple.new(matrix*other.vector)
      else
        Matrix.new(matrix*other.matrix)
      end
    end

    def transpose
      Matrix.new(matrix.transpose)
    end

    def determinant
      matrix.determinant
    end

    def submatrix(row, column)
      Matrix.new(matrix.first_minor(row, column))
    end
  end
end
