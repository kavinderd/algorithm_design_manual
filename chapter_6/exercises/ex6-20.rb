# Exercise 6-20
### Problem ###
# Can we modify Dijkstra's algorithm to solve the single-source longest path problem
# by changing minimum to maximum? If so, then prove your algorithm correct. If not, 
# then prove a counterexample.
### End ###
#
# Yes, this can be solved in two ways. Either all the edges can be negated, all heavy edges would become
# the most negative and Dijkstra's algorithm can be run as normal. Another way is to modify
# Dijkstra's algorithm to look for the max distance at each step instead of the minimum distance.
#
# Will implement later
