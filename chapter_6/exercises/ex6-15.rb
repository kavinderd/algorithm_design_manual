# Exercise 6-15
### Problem ###
# Let G=(V,E) be an undirected weighted graph and let T be the shortest-path spanning tree rooted
# at vertex v. Suppose now that all the edge weights in G are increased by a constant number k.
# Is T still the shortest-path spanning tree from v?
### End ###
#
# 
# Not necessarily,
# E.G.
# G
# A-B 2
# B-C 4
# A-C 1
#
# Initial T rooted at B
# A-B 2
# A-C 1
#
# if k > 1
#
# G' (k = 2)
# A-B 4
# B-C 6
# A-C 3
#
# T rooted at B
# A-B 4
# B-C 6
#
# TODO: NEED TO CHECK
