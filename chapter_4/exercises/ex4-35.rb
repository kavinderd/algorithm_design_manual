# Exercise 4-35
### Problem ###
# Let M be an N x M integer matrix in which the entries of each row are sorted
# in increasing order from left to right and the entries in each column are
# in increasing order from top to bottom. Give an efficient algorithm to find the 
# position of an integer x in M, or to determine that x is not there. How many
# comparions of x with matrix entries does your algorithm use in worst case?
### End ###
# 
# This problem can be solved in worst case O(n+m) time.  By checking from the right most
# column to the left and increasing the row when the current key is greater than the
# sought for key we can traverse the matrix and find our key. The time complexity is O(n+m)
# because in the worst case we would need to traverse a position in every row and a position
# in every column hence n + m
#

def find_in_matrix(key, matrix, rows, cols)
  row = 0
  col = matrix[0].size - 1
  result = []
  while(row < rows && col >= 0)
    if matrix[row][col] == key
      result = [row, col]
      break
    elsif matrix[row][col] > key
      col -= 1
    else
      row += 1;
    end
  end
  result
end

matrix = [[0,1,2], [3,4,5], [6,7,8]]

puts "4 is at #{find_in_matrix(4, matrix, 3, 3)}"

