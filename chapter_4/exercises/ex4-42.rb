# Exercise 4-42
### Problem ###
# Implement an algorithm that takes an input array and returns only the unique elements in it.
### End ###

def uniq(array)
  counts = Hash.new(0)
  result = []
  array.each do |element|
    counts[element] += 1
    result << element unless counts[element] > 1
  end
  result
end
