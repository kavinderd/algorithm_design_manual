# Exercise 5-29
### Problem ###
# Following up on the previous problem, give an O(n+m) algorithm that fins a deletion order for the n vertices
# such that no deletion disconnects the graph. (Hint thing DFS/BFS)
### End ###
#
 

require_relative "../examples/ruby-graph/graph"
require_relative "../examples/ruby-graph/bfs"
require_relative "../examples/ruby-graph/dfs"

g = Graph.new
initialize_graph(g, false)
read_graph(g, false)

extend BFS
module DFS

  def initialize_search(g)
    @deletion_order = []
    @entry_time = []
    @time = 0
    @exit_time = []
    @finished = false
    super
  end

  def process_vertex_late(v)
    @deletion_order << v
  end
end

extend DFS



initialize_search(g)
1.upto(g.nvertices) do |i|
  if !@discovered[i]
    dfs(g, i)
  end
end
p "DELETION ORDER #{@deletion_order}"
