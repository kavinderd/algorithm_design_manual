class EdgeNode < Struct.new(:vertex, :capacity, :flow, :residual, :next)
  def y
    vertex
  end
end
class FlowGraph < Struct.new(:edges, :degree, :nvertices, :nedges, :directed); end;
require_relative 'bfs'

MAXV = 1000

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

def read_flow_graph(g, directed)
  initialize_graph(g, directed)
  puts "Enter the number of vertices and the number of edges (e.g. 5 5)"
  g.nvertices, edges = gets.chomp.split.map { |char| char.to_i }
  puts "Enter all edges ( start end weight)"
  1.upto(edges) do |i|
    x, y, weight = gets.chomp.split.map { |char| char.to_i }
    insert_flow_edge(g, x, y, directed, weight)
  end
end

def insert_flow_edge(g, x, y, directed, w)
  edge = EdgeNode.new(y, w, 0, w, g.edges[x])
  g.edges[x] = edge
  g.degree[x] += 1
  g.nedges += 1
end

def print_flow_graph(g)
  1.upto(g.nvertices) do |i|
    p "#{i}:"
    p = g.edges[i]
    while p
      p " #{p.vertex} (#{p.capacity}, #{p.flow}, #{p.residual})"
      p  = p.next
    end
    p "\n"
  end
end

def add_residual_edges(g)
  1.upto(g.nvertices) do |i|
    p = g.edges[i]
    while p
      unless find_edge(g, p.vertex, i) 
        insert_flow_edge(g, p.vertex, i, true, 0)
      end
      p = p.next
    end
  end
end

def initialize_search(g)
  @processed = []
  @discovered = []
  @parent= [-1] * (g.nvertices + 1)
end

def netflow(graph, source, sink)
  volume = 0
  add_residual_edges(graph)
  initialize_search(graph)
  bfs(graph, source)
  volume = path_volume(graph, source, sink, @parent)

  while volume > 0
    augment_path(graph, source, sink, @parent, volume)
    initialize_search(graph)
    bfs(graph, source)
    volume = path_volume(graph, source, sink, @parent)
  end
end

def valid_edge(edgenode)
  edgenode.residual > 0 
end

def path_volume(graph, start, finish, parents)
  return 0 if parents[finish] == -1

  e = find_edge(graph, parents[finish], finish)

  if start == parents[finish]
    e.residual
  else
    [path_volume(graph, start, parents[finish], parents), e.residual].min
  end
end

def find_edge(graph, x, y)
  p = graph.edges[x]
  while p
    return p if p.vertex == y
    p = p.next
  end
end

def augment_path(graph, start, finish, parents, volume)
  return if start == finish

  e = find_edge(graph, parents[finish], finish)
  e.flow += volume
  e.residual -= volume

  e = find_edge(graph, finish, parents[finish])
  e.residual += volume

  augment_path(graph, start, parents[finish], parents, volume)
end

g = FlowGraph.new
extend BFS
read_flow_graph(g, true)
puts "Now tell me the source and the sink"
source, sink = gets.chomp.split.map { |char| char.to_i }
netflow(g,source, sink)
print_flow_graph(g)
flow = 0
p = g.edges[source]
while p
  flow += p.flow
  p = p.next
end

puts "Total Flow = #{flow}"
