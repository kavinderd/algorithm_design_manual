# Exercise 4-4
### Problem ##
# Assume that we are given n pairs of items as input, where the first item is a number and the second item
# is one of three colors ( red, blue or yellow). Further assume that the items are sorted by number. Give an
# O(n) algorithm to sort the items by color (all reds before all blues before all yellows) such that the numbers
# for identical colors stay sorted.
# For example (1, blue), (3, red), (4, blue), (6, yellow), (9, red) should become (3, red), (9, red), (1, blue), (4, blue), (6, yellow).
#
# To solve this problem in O(n) we need to step through the array twice. The first time around, we pick a pivot point and sort reds from
# blues and yellows. This would result in:
#   (3, red), (9, red), (4, blue), (6, yellow), (1, blue)
# Then we sort blues from yellows and as a second check we check number value when two colors are the same. This results in:
#   (3, red), (9, red), (1, blue), (4, blue), (6, yellow)

def sort_by_color(array)
  colors = [:red, :blue, :yellow]
  i = 0
  j = 1
  0.upto(array.size - 1) do
    break if j > array.size - 1
    if array[i][1] != :red && array[j][1] == :red 
      array[i], array[j] = array[j], array[i]
      i += 1
    end
    j += 1
  end
  
  # i is now at the position right after the last red
  j = array.size - 1
  p array
  while i < j
    if array[i][1] == :yellow && array[j][1] == :blue
      array[i], array[j] = array[j], array[i]
      i += 1
    elsif array[i][1] == :blue && array[j][1] == :blue && array[i][0] > array[j][0]
      array[i], array[j] = array[j], array[i]
      i += 1
    else
      j -= 1
    end
  end
  array
end

array = [[1, :blue], [3, :red], [4, :blue], [5, :blue],[6, :yellow],[8, :blue], [9, :red]]
puts "sorted array = #{sort_by_color(array)}"
