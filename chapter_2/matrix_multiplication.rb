# TODO: Referesh on matrices
module Algorithms
  extend self

  def matrix_multiplication(mtx_a, mtx_b)
    x = mtx_a.size
    y = mtx_b.size
    z = mtx_b[0].size
    result = [Array.new(y)]
    x.times do |i|
      y.times do |j|
        result[i][j] = 0;
          z.times do |k|
            result[i][j] += mtx_a[i][j] * mtx_b[j][k]
          end
      end
    end
    p result
  end
end

a = [ [0,2,5],
      [4,2,5],
      [1,2,3],
      [3,3,3]]
               
b = [ [4,5,1,4,6],
      [6,7,2,4,6],
      [1,4,6,8,3]]

Algorithms.matrix_multiplication(a, b)
