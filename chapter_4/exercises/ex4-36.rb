# Exercise 4-36
### Problem ###
# Consider an N x N array A containing integer elements (positive, negative, and zero). Assume that the elements in each row
# of A are in strictly increasing order, and the elements of each column of A are in strictly decreasing order. Hence there cannot be 
# two zeroes in the same row or the same column. Describe an efficient algorithm that counts the number of occurences of the
# element 0 in A. Analyze its running time.
### End ###
# 
# To solve this problem we can start in the bottom right and work our way to the left and up. This algorithm would run in
# worst case O(n + m) time where we would need to check an element in every row and every column.

def find_zeroes(matrix)
  rows = matrix.size
  cols = matrix[0].size
  row = rows - 1
  col = cols - 1
  zeroes = 0
  while row >= 0 && col >= 0
    if matrix[row][col] == 0
      zeroes += 1
      row -= 1
    elsif matrix[row][col] > 0
      col -= 1
    else
      row -= 1
    end
  end
  zeroes
end

matrix = [[0,1,2], [-1, 0, 1], [-2, -1, 0]]

puts "I have found #{find_zeroes(matrix)} zeroes"
