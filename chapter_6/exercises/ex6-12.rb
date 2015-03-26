# Exercise 6-12
### Problem ###
# Devise an efficient data structure to handle the following operations on a weighted directed graph.
# a) Merge two given components
# b) Locate which component contains a given vertex v
# c) Retrieve the minimum edge from a given component.
### End ###
# 
class UnionFind
  SET_SIZE = 100
  def initialize
    @p = [SET_SIZE + 1]       # Parent Elements
    @size = [SET_SIZE + 1]    # Number of elements in subtree i
    @n = 0                    # Number of elements in set
    @minedge = [SET_SIZE + 1] # Min edge in subtree
  end

  def find(v)
    parent = @p[v]
    while parent
      parent = @p[v]
    end
    parent || v
  end

end

