# Exercise 4-32
### Problem ###
# Consider the numerical 20 Questions game. In this game Player 1 thinks of a number in the range 1
# to n. Player 2 has to figure out this number by asking the fewest number of true/false questions. 
# Assume that nobody cheats.
#  - What is an optimal strategy if n is known?
#  - What is a good strategy if n is not known?
### End ###
#
# If n is known then taking a binary search approach would be ideal where the player successively asks
# whether the number is greater or smaller than the mid between the current low and high. This will take O(logn) time
# so n can be a very large number and still be found in less than 20 questions.
#
# If n is not known then it makes sense to pick a large value to guess for n, usefully a power of 2. If the number is less
# than 2^i then the range is between 1 to 2 ^ i, if not simply increase the power of 2 and guess again, knowning then that the value is
# between 2^ i and 2^i+1
