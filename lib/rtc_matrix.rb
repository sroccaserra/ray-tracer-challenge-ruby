require 'matrix'

require_relative './rtc_tuple'

def matrix(*rows)
  RayTracerChallenge::Matrix.new(::Matrix.rows(rows))
end

def identity_matrix
  RayTracerChallenge::Matrix.new(::Matrix.diagonal(1, 1, 1, 1))
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
  end
end
