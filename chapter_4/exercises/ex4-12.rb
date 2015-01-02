# Exercise 4-12
### Problem ###
# Devise an algorithm for finding, the k smallest elements of an unsorted set of n
# integers in O(n + klogn)
### End ###
# 
# To solve this problem in the required time, first we need to create a out-of-order heap
# where the smallest element is at the root but there is no certainty that any of the other
# elements are in the correct position. This will take O(n) time. Then we need to extract the 
# k smallest elements each of which takes logn time for a total of O(klogn). In total this 
# algorithm runs in O(n + klogn).
#
#

def build_unsorted_heap(array)
  0.upto(array.size - 1) do |i|
    if array[0] > array[i]
      array[0], array[i] = array[i], array[0]
    end
  end
  array
end

def bubble_down(array, index)
  child = 0
  child = index == 0 ? 1 : index * 2
  min_index = index
  0.upto(1) do |i|
    if(child+i) < array.size
      if array[min_index] > array[child+i]
        min_index = child+i
      end
    end
  end
  if min_index != index
    array[min_index], array[index] = array[index], array[min_index]
    bubble_down(array, min_index)
  end
  array
end

def extract_min(array)
  min = array.shift
  array[0], array[-1] = array[-1], array[0]
  min 
end
def extract_k_smallest_elements(array, k)
  array = build_unsorted_heap(array)
  smallest_k = []
  while smallest_k.size <= k
    smallest_k << extract_min(array)
    bubble_down(array, 0)
  end
  smallest_k
end

array = [55,334,2,6,4,33,1,77,30,12,19,20,5]
puts "Smallest 5 numbers = #{extract_k_smallest_elements(array, 5)}"
