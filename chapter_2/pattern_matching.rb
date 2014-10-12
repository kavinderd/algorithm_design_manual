# Substring Pattern Matching
# Given two strings, string and substring
# Find the index position in string at which substring can be found
# 
# This algorithm runs in O(nm) time where n is the length of the string and m the length of the substring
# This can be explained as such.
# The outer loop runs n-m times
# The inner loops at worst m times
# so an initial order of growth would be O((n-m)(m))
# this gives us O(nm-m^2)
# we can assume that n > m as the substring will always be shorter than the string
# thus we can also assume that nm > m^2
# without any penalty we can remove m^2 since it is dominated by nm
# finally removing m^2 leaves us with O(nm)
module Algorithms

  extend self
  def find_match(string, substring)
    length = string.length - substring.length
    length.times do |i|
      j = 0;
      while((j < string.length) && (string[i+j] == substring[j]))
        j += 1;
      end
      return i if j == substring.length
    end
  end
end


puts Algorithms.find_match('this is an extremely long string with lots of words and stuff', 'string')
