# Exercise 5-23
### Problem ###
# Your job is to arrange n ill-behaved children in a straight line, facing front. You are given a list of m statements of the form "i hates j". If i hates j then you do not want to put i somehwere behind j, because then i is capable of throwing something at j.
#
# a) Give an algorithm that orders the line, (or says that it is not possible) in O(m+n) time.
#
# b) Suppose instead you want to arrange the cildren in rows such that if i hates j then i must be in a lower numbered row than j. Give an efficient algorithm to find the minimum number of rows needed, if it is possible.
### End ###
# 
# Solving a is possible in O(m+n) time provided that the cost of creating the directed graph of children is not considered. So, given a directed graph where vertices are children and directed edges reflect the relationship "i hates j" where an edge would go from j to i. With this graph the line can be constructed with a topological sort. This topological sort would return the children in an order that would ensure that i comes before j.

puts "Let's make sure these kids are in order"
puts "When entering the edges the first number is the kid that hates the second number"

require_relative "../examples/ruby-graph/graph"
require_relative "../examples/ruby-graph/bfs"
require_relative "../examples/ruby-graph/dfs"
require_relative "../examples/ruby-graph/top_sort"

g =Graph.new
initialize_graph(g, true)
read_graph(g, true)
print_graph(g)
extend BFS
extend DFS
extend TopSort

initialize_search(g)
top_sort(g)


# Solving b requires using a BFS to track the greatest depth from any vertex.

module DepthSort

  attr_reader :max_depth

  def initialize_search(g)
    @depth = [0] * (g.nvertices + 1)
    @max_depth = 0
    super
  end

  def bfs(graph, start)
    queue = []
    queue.unshift start
    @discovered[start] = true
    while queue.any?
      v = queue.shift
      @max_depth = [@max_depth, @depth[v]].max
      process_vertex_early(v)
      @processed[v] = true
      p = graph.edges[v]
      while p
        y = p.y
        if !@processed[y] || graph.directed
          #process_edge(v, y)
        end
        if !@discovered[y]
          queue.push y
          @depth[y] = @depth[v] + 1
          @discovered[y] = true
          @parent[y] = v
        end
        p = p.next
      end
      process_vertex_late(v)
    end
  end

end
  
extend DepthSort
initialize_search(g)
max = 0
1.upto(g.nvertices) do |i|
  initialize_search(g)
  bfs(g,i)
  max = [max, max_depth].max
end
puts max




