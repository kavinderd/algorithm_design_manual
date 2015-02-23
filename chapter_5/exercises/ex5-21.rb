# Exercise 5-21
### Problem ###
# Let v and w be two vertices in a directed G=(V,E). Design a linear time algorithm to find the number
# of different shortest paths (not necessarily vertex disjoint) between v and w. Not: the edges in G are unweighted.
### End ###

require_relative "../examples/ruby-graph/graph"
require_relative "../examples/ruby-graph/bfs"

g = Graph.new
read_graph(g, true)
module ShortestPath

  def initialize_search(graph)
    @level = 0
    @levels = [0] * (graph.nvertices + 1)
    @paths = []
    @shortest_path = 0
    @current_path
    @found = false
    super
  end

  def find_path(graph, start, finish)
    queue = []
    queue.unshift start
    @discovered[start] = true
    while queue.any?
      v = queue.shift
      process_vertex_early(v)
      @processed[v] = true
      p = graph.edges[v]
      while p
        y = p.y
        if !@discovered[y]
          queue.push y
          @discovered[y] = true
          @levels[y] = @levels[v] + 1
          @parent[y] = v
        end
        if p.y == finish
          @found = true
          path = @levels[v] + 1
          @paths << path
          break
        end
        p = p.next
      end
    end
    p @paths
  end
end

extend BFS
extend ShortestPath

puts "Enter Start Vertex"
start = gets.chomp.to_i
puts "Enter Finish Vertex"
finish = gets.chomp.to_i
initialize_search(g)
find_path(g, start, finish)

