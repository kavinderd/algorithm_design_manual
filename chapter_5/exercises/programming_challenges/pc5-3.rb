# Programming Challenge 5-3
# "The Tourist Guide"
require_relative "../../examples/ruby-graph/graph"

require_relative "../../examples/ruby-graph/bfs"


def insert_edge(g, x, y, directed, weight)
  edge = EdgeNode.new(y,nil,g.edges[x])
  edge.weight = weight
  g.edges[x] = edge
  g.degree[x] += 1
  if directed == false
    insert_edge(g, y, x,true)
  else
    g.nedges += 1
  end
end

def read_graph(g, directed=false)
  initialize_graph(g, directed)
  puts "Enter the number of vertices and the number of edges (e.g. 5 5)"
  g.nvertices, edges = gets.chomp.split.map { |char| char.to_i }
  puts "Enter all edges"
  1.upto(edges) do |i|
    x, y, z = gets.chomp.split.map { |char| char.to_i }
    insert_edge(g, x, y, directed, z)
  end
end

module ShortestPath

  def initialize_search(graph)
    @level = 0
    @levels = [0] * (graph.nvertices + 1)
    @paths = []
    @weights = [0] * (graph.nvertices + 1
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

