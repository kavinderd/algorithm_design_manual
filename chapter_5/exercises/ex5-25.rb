# Exercise 5-25
### Problem ###
# An arborescence of a directed graph G is a rooted tree such that there is a directed path
# from the root to every other vertex in the graph. Give an efficient and correct algorithm to test whether
# G contains an arborescence and its time complexity.
### End ###
#

require_relative "../examples/ruby-graph/graph"
require_relative "../examples/ruby-graph/bfs"
require_relative "../examples/ruby-graph/dfs"

g = Graph.new
initialize_graph(g, true)
read_graph(g, true)

extend BFS
extend DFS
module Arboreal

  def arborescence?(graph, i)
    edges = ( @exit_time[i] -  @entry_time[i] ) / 2
    if edges == (graph.nvertices - 1)
      puts "!!!!!Arborescence at #{i}!!!!"
    end
  end

end

extend Arboreal

1.upto(g.nvertices) do |i|
  initialize_search(g)
  dfs(g, i)
  arborescence?(g, i)
end


