# Programming Challenge 4-2
# Stacks of Flapjacks
#

def flip(array, index)
  i = index
  j = 0
  while j < i
    array[j], array[i] = array[i], array[j]
    i -= 1
    j += 1
  end
end


def sort_flapjacks(array)
  flips = 0

  (array.size-1).downto(0) do |i|
    big_num = array[i]
    index =i
    (i-1).downto(0) do |j|
      if array[index] < array[j]
        index = j
      end
    end
    if array[index] != array[i]
      # Flip big to top
      flip(array, index)
      flips += 1
      # Flip big to position
      flip(array, i)
      flips += 1
    end
  end
  p array
  p flips
  p 0 unless flips == 0
end

array = [2,5,7,6,4,8]
puts "Sorting Jacks [ 2,5,7,6,4,8]"
sort_flapjacks(array)


