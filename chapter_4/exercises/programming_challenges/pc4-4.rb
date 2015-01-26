# Exercise ShoeMaker's Problem
# 
# This problem can be solved using a greedy algorithm where each successive
# decision made is optimal in the moment without regard to the overall
# situation.
# Given two jobs i = (5 days, 5 fee) and j ( 2 days, 3 fee) when deciding which
# job should go first we need to compare the product of i(days) * j(fee) and
# i(fee) * j(days). Then whichever is lesser the pair from which the days 
# was multiplied should be selected. Given the above example, this would be
# 2 3
# 5 5
#
# In this case our total fine would be 10, if switched it would have been 15
#

def pick_first?(day1, day2)
  if day1[:days] * day2[:fee] < day1[:fee] * day2[:days]
    return 1
  elsif day1[:days] * day2[:fee] == day1[:fee] * day2[:days]
    return 0
  else
    return -1
  end
end

def sort_jobs(array)
  result = []
  order = []
  i = 0
  j = 1
  loop do
    if array[i] && array[j]
      p "Comparing #{array[i]} to #{array[j]}"
      answer = pick_first?(array[i], array[j])
      if answer == 1
        # Pick i
        result << array[i]
        order << i
        i = j
        j+= 1
      elsif answer == 0
        # Same, compare against previous day count
        if array[i][:fee] * result[-1][:days] <= array[j][:fee] * result[-1][:days]
          result << array[i]
          order << i
          i = j
          j += 1
        else
          result << array[j]
          order << j
          j += 1
        end
      else
        result << array[j]
        order << j
        j += 1
      end
    elsif array[i].nil?
      result << array[j]
      order << j
    elsif array[j].nil?
      result << array[i]
      order << i
    else break
    end
    break if result.size == array.size
  end
  p result
  p order
end

array = [ {days: 3, fee: 4}, { days:1, fee: 1000}, {days:2, fee:2}, {days: 5, fee: 5}]
sort_jobs(array)

