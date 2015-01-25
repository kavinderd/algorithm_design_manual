# Exercise 4-45
### Problem ###
# Given a search string of three words, find the smallest snippet of the document that contains
# all three of the search words. ie, the snippet with the smallest number of words in it. You
# are given the index positions where these words occur in the document such as word1: (1,4,5), word2(3,9,10)
# and word3: (2,6, 15). Each of the lists are in sorted order as above.
### End ###
#

def smallest_snippet(word_indices)
  stack = []
  count = word_indices.size
  winner = []
  min_span = 9999
  while word_indices.first.any?
    count.times do |i|
      stack << word_indices[i].shift
    end
    stack.sort!
    if (stack[-1] - stack[0]) < min_span
      winner = stack    
      min_span = stack[-1] - stack[0]
    end
    stack = []
  end
  winner
end

puts "SMallest Snippet is #{smallest_snippet([[1,4,5], [3,9,10], [2,6,15]])}"
