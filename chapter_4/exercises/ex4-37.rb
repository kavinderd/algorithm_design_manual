# Exercise 4-37
### Problem ###
# Implement versions of several different sorting algorithms, such as selection sort
# insertion sort, heapsort, mergesort, and quicksort. Condudct experiments to asses
# the relative performance of these algorithms in a simple application that reads a large
# text file and reports exactly one instance of each word that appears within it. This
# application can be efficiently implemented by sorting all the words that occur in the text
# and then passing through the sorted sequence to identify one instance of each distinct word.
# Write a brief report with your conclusions.
### End ###

def selection_sort(array)
  0.upto(array.size-2) do |i|
    min = i
    i.upto(array.size - 1) do |j|
      if array[j] < array[min]
        min = j
      end
    end
    array[i], array[min] = array[min], array[i]
  end
  array
end

def insertion_sort(array)
  1.upto(array.size-1) do |i|
    j = i
    while j > 0 && array[j-1] > array[j]
      array[j], array[j-1] = array[j-1], array[j]
      j -= 1
    end
  end
  array
end

def heapify(array, index, size)
  top = array[index]
  while index < size/2
    left_child = 2 * index + 1
    right_child = left_child + 1
    if right_child < size && array[left_child] < array[right_child]
      larger_child = right_child
    else
      larger_child = left_child
    end

    break if top >= array[larger_child]
    array[index] = array[larger_child]
    index = larger_child
  end
  array[index] = top
  array
end

def heapsort(array)
  start = (array.size/2) - 1
  start.downto(0) do |i|
    array = heapify(array, i, array.size)
  end
  size = array.size-1
  (array.size-1).downto(1) do |i|
    node, array[0] = array[0], array[i]
    heapify(array, 0, i)
    array[i] = node
  end
  array
end

def merge(l_arr, r_arr)
  i =0
  j = 0
  result = []
  while i < l_arr.size  && j < r_arr.size
    if l_arr[i] < r_arr[j]
      result << l_arr[i]
      i += 1
    else
     result << r_arr[j]
     j += 1
    end 
  end
  while i < l_arr.size
    result << l_arr[i]
    i += 1
  end
  while j < r_arr.size
    result << r_arr[j]
    j += 1
  end
  result
end

def mergesort(array)
  if array.size == 1
    array
  else
    mid = array.size / 2
    l_arr = mergesort(array.slice(0...mid))
    r_arr = mergesort(array.slice(mid..-1))
    merge(l_arr, r_arr)
  end
end

def partition(array, left, right, pivot)
  left = left - 1
  right = right + 1
  while(true)
    loop do
      left += 1
      break unless left < right && array[left] < pivot
    end
    loop do
      right -= 1
      break unless right > left && array[right] > pivot
    end
    if left >= right
      break
    else
      array[left], array[right] = array[right], array[left]
    end
  end
  left
end

def quicksort(array, left, right)
  if right - left <= 1
    array
  else
    pivot_index = (left + ((right - left)/2)).to_i
    pivot = array[pivot_index]
    partition = partition(array, left, right, pivot)
    quicksort(array, left, partition - 1)
    quicksort(array, partition, right)
    array
  end
end
require 'pry'
require 'pry-debugger'
file = File.readlines("chapter_4/exercises/lorem_ipsum.txt")
words = []
file.each do |line|
  words << line.split(/\W+/).map { |word| word.strip.downcase }
end

words = words.flatten.uniq


require "benchmark" 
puts "Word count #{words.size}"
Benchmark.bmbm do |x|
  x.report("selection_sort") { selection_sort(words.dup) }
  x.report("insertion_sort") { insertion_sort(words.dup) }
  x.report("heapsort") { heapsort(words.dup) }
  x.report("mergesort") { mergesort(words.dup) }
  x.report("quicksort") { quicksort(words.dup, 0, words.size - 1)} 
end

inser = insertion_sort(words)
merg = mergesort(words)

p "comparing words"
0.upto(words.count) do |i|
  if inser[i] != merg[i]
    puts "ITS ALLA  LIE AT #{i}"
  end
end
