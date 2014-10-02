# Selection Sort
# This algorithm runs in 0(n^2) time because
# The outer loops runs n times for any loop
# While the inner loops runs in n-i-1 times where i is the position in the outer for loop
# so the inner loop makes n-i-1 comparisons.
#
# eg. n = 5, list = [5,2,1,0,3]
# when i = 0 and j = 1
# compare i to j=1, j=2, j=3, j=4 so n-1 comparisons
# when i = 1 and j = 2
# compare i to j=2, j=3, j=4 so in total n-1 + n-2 comparisons
# when i = 2 and j = 3
# compare i to j=3, j=4 so in total n-1 + n-2 + n-3 comparisons
#
# so mathematically this algorithm can be seen as the sum of n-1 terms ( 4 + 3 + 2 + 1 in the example above)
# the formula for this is (n(n-1))/2
# removing the constants this leaves us with n(n) or n^2
module Algorithms
  extend self

  def selection_sort(list)
    max = list.size - 1
    for i in 0..max do
      min = i
      for j in (i+1)..max do
        if list[j] < list[min]
          min = j
          list[j], list[i] = list[i], list[j]
        end
      end
      p list
    end
  end
end


Algorithms.selection_sort([0,43,12,55,33,123,5,6,12324,53,2,44,6])
