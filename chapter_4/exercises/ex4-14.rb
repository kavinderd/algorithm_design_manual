# Exercise 4-14
### Problem ###
# Give an O(nlogk)-time algorithm that merges k sorted lists with a total of n elements
# into one sorted list. (Hint: Use a heap to speed up the elementary o(kn)-time algorithm)
### End ###
#
# In this problem we have k sorted list, so: [1,3,5,7,9] and [2,4,6,8,10] and we need to 
# merge the two in O(10log2) time for the given example. A heap can be cleverly used to complete
# this problem in the alloted time. First a min-heap of size k should be constructed with an element from
# each list. Each node in the heap should keep a reference of which list it came from. Then we can repeatedly 
# extract the min element from the heap and add the corresponding next element from the list which the min
# element originally came from

class HeapItem < Struct.new(:value, :list_number); end;

def insert(heap, item)
  heap << item
  bubble_up(heap, heap.size - 1)
end

def parent(index)
  index == 0 ? -1 : (index-1)/2.floor
end

def bubble_up(heap, index)
  return if parent(index) == -1
  if heap[parent(index)].value > heap[index].value
    heap[parent(index)], heap[index] = heap[index], heap[parent(index)]
    bubble_up(heap, parent(index))
  end
end

def bubble_down(heap, index)
  child = 2 * index + 1
  min_index = index
  0.upto(1) do |i|
    if(child + 1) < heap.size
      if heap[min_index].value > heap[child+1].value
        min_index = child + 1
      end
    end
  end
  if min_index != index
    heap[min_index], heap[index] = heap[index], heap[min_index]
    bubble_down(heap, min_index)
  end
end

def extract_min(heap)
  min = heap.shift
  heap[0], heap[-1] = heap[-1], heap[0]
  min
end


def merge_arrays(array)
  count = array.count
  heap = []
  result = []
  # Setup initial Heap
  count.times do |i|
    item = HeapItem.new(array[i].shift, i)
    insert(heap, item)
  end
  while heap.size > 0
    min = extract_min(heap)
    break unless min
    if array[min.list_number].any?
      item = HeapItem.new(array[min.list_number].shift, min.list_number)
      insert(heap, item)
    else
      bubble_down(heap, 0)
    end
    result << min.value
  end
  result
end

array1 = [1,3,5,7,9,11]
array2 = [4,10,12]
array3 = [2,6,8]

p merge_arrays([array1, array2, array3])

