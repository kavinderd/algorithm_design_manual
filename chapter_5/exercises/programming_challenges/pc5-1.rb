# Programming Challenge 5-1

require_relative "../../examples/ruby-graph/graph"

require_relative "../../examples/ruby-graph/bfs"

require_relative "../../examples/ruby-graph/bipartite"

def read_graph(g, directed = false)
  initialize_graph(g, directed)
  puts "Enter the number of vertices"
  g.nvertices = gets.chomp.to_i
  puts "Enter number of edges"
  edges = gets.chomp.to_i
  puts "Enter all edges"
  1.upto(edges) do |i|
    x, y = gets.chomp.split.map { |char| char.to_i }
    insert_edge(g, x, y, directed)
  end
end

module Bipartite
  def process_edge(x,y)
    if @color[x] == @color[y]
      @bipartite = false
    end 
    @color[y] = complement(@color[x])
  end
end

extend BFS
extend Bipartite
g = Graph.new
read_graph(g, false)
initialize_search(g)
two_color(g)


