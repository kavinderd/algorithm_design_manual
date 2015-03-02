# Exercise 5-28
### Problem ###
# An articulation vertex of a graph G is a vertex whose deletion disconnects G. Let G be a graph with
# n vertices an m edges. Give a simple O(n+m) algorithm for finding a vertex of G that is not an articulation vertex, whose deletion does 
# not disconnect G
### End ###

require_relative "../examples/ruby-graph/graph"
require_relative "../examples/ruby-graph/bfs"
require_relative "../examples/ruby-graph/dfs"

g = Graph.new
initialize_graph(g, false)
read_graph(g, false)

extend BFS
module DFS

  def process_vertex_late(v)
    if @entry_time[v] == @time
      puts "#{v} is a non-articulation vertex"
    end
  end

end

extend DFS

1.upto(g.nvertices) do |i|
  initialize_search(g)
  dfs(g, i)
end

