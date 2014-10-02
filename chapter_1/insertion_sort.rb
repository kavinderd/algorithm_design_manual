def i_sort(list)
  result = list.dup
  j = 0
  0.upto(list.size - 1) do |i|
    j = i #Set j to i, check for every value in the list after i for swapability
    while((j > 0) && (result[j] < result[j-1]))
      result[j], result[j-1] = result[j-1], result[j]
      j -= 1
    end
    p result
  end
  result 
end
