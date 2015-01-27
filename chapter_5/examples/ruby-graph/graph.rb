MAXV = 1000

class EdgeNode < Struct.new(:y, :weight, :next); end;
class Graph < Struct.new(:edges, :degree, :nvertices, :nedges, :directed);end;

def initialize_graph(g, directed)
  g.nvertices = 0
  g.nedges = 0
  g.directed = directed
  g.degree = []
  g.edges = []
  1.upto(MAXV) do |i|
    g.degree[i] = 0
    g.edges[i] = nil
  end
end

def insert_edge(g, x, y, directed)
  edge = EdgeNode.new(y,nil,g.edges[x])
  g.edges[x] = edge
  g.degree[x] += 1
  if directed == false
    insert_edge(g, y, x,true)
  else
    g.nedges += 1
  end
end

def read_graph(g, directed)
  initialize_graph(g, directed)
  puts "Enter the number of vertices and the number of edges (e.g. 5 5)"
  g.nvertices, edges = gets.chomp.split.map { |char| char.to_i }
  puts "Enter all edges"
  1.upto(edges) do |i|
    x, y = gets.chomp.split.map { |char| char.to_i }
    insert_edge(g, x, y, directed)
  end
end

def print_graph(g)
  1.upto(g.nvertices) do |i|
    print "#{i}:"
    p = g.edges[i]
    while p
      print " #{p.y}"
      p = p.next
    end
    print "\n"
  end
end 

