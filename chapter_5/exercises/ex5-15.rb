# Exercise 5-15
### Problem ###
# An independent set of graph G = (V, E) is a subset of vertices V' e V such that no edge in E contains both 
# vertices from V'
#
# An independent vertex cover is a subset of verties that is both an independent set and a vertex cover of G.
# Give an efficient algorithm for testing whether G contains an independent vertex cover. What classical graph
# problem does this reduce to?
### End ###
#
# This problem can effectively be reduced to testing for whether a graph is bipartite or not. The resulting independent
# set is all the vertices of the same color.

require_relative "../examples/ruby-graph/graph"
require_relative "../examples/ruby-graph/bfs"
require_relative "../examples/ruby-graph/bipartite"

g = Graph.new
read_graph(g, false)
print_graph(g)
extend BFS
initialize_search(g)
module Bipartite
  def colored_independent_sets(g)
    @yellows = []
    @greens = []
    1.upto(g.nvertices) do |i|
      if @color[i] == YELLOW
        @yellows << i
      else
        @greens << i
      end
    end
    [@yellows, @greens]
  end
end
extend Bipartite
two_color(g)
colored_independent_sets(g).each do |set|
  p "Independent Set #{set}"
end


