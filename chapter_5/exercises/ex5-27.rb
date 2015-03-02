# Exercise 5-27
### Problem ###
# A tournament is a directed graph formed by taking the complete undirected graph and assigning directions on the edges. 
# A graph G = (V,E) such that for all u,v in V exactly one of (u,v) or (v,u) is in E. Show that every tournament is a 
# Hamiltonian path - that is a path that visits every vertex exactly once. Give an algorithm to find this path.
### End ###
# 
# Given the undirected graph
#
# A <----> B
#
# When creating a tournament from this we would end up with one of the following graphs
#
# A <--- B
# or
# B ---> A
#
# In this case there is a hamiltonian path from A to B or B to A. If the number of vertices were to increase in the tournament
# the existence of a hamiltonian path would remain. For example if another vertex C were added to the original graph, two new 
# edges would exist A-C and C-B. Regardless of which direction those edges are set in the tournament a hamiltonian
# path would still exist. 
#
#     Original tournament
#
#     A < ---- B
#
#     Add vertex C
#
#
#     C <--------A
#       \        ^
#         \      |
#           \    |
#             -> B
#
#   In the above graph the hamiltonian path is C-B-A. But if any of those edges' directions were to change the hamiltonian path
#   would still exist, the path would perhaps be different.
#
# To find a hamiltonian path a DFS needs to be conducted on every V. If the number of edges visited for any given vertex equals the number of 
# vertices - 1 then the path is a Hamiltonian Path.
#
# The code for this would be very similar to ex 5-25 so I'm leaving it out.
