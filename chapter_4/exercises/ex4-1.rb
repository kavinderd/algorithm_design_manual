# 4-1
### Problem ##
# The Grinch is given the job of partioning 2n players into two teams of n players each. 
# Each player has a numerical rating that measures how good he/she is at the game. 
# He seeks to divide the players as unfairly as possible so as to create the biggest possible talent
# imbalance between team A and team B. Show how the Grinch can do the job in O(nlogn) time.
### End ## 
# 
# Given an array [4, 5, 3, 10, 11, 12, 1, 16] the ideal scenario
# would be to split it up into the teams [1, 3, 4, 5] and [10, 11, 12, 16]
# the O(nlogn) would be to sort the array and split it at n

def grinchify(array)
  count = array.count
  mid = count / 2
  array = mergesort(array)
  [array[0...mid], array[mid...count]]
end

def mergesort(array) 
  if array.count <= 1
    return array
  else
    mid = array.size / 2
    left_array = mergesort(array[0...mid])
    right_array = mergesort(array[mid..-1])
    merge(left_array, right_array)
  end
end

def merge(left, right)
  i = 0
  j = 0
  result = []
  while i < left.count && j < right.count
    if left[i] < right[j]
      result << left[i]
      i += 1
    elsif right[j] < left[i]
      result << right[j]
      j += 1
    end
  end

  while i < left.count
    result << left[i]
    i += 1
  end
  
  while j < right.count
    result << right[j]
    j += 1
  end
  result
end

test = [4,5,3,10,11,12,1,16]
test = grinchify(test)
p "Your two teams are #{test}" 

