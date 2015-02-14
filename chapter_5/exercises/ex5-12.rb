# Exercise 5-12
### Problem ###
# The square of a directed graph G = (V,E) is the graph G^2(v, E^2) such that (u,w) in E^2 iff there exists v in V such that (u,v) in E and (v,w) in E.
# i.e. there is a path of exactly two edges from u to w.
# Give efficient algorithms for both adjacency lists and matrices.
### End ###

require_relative "../examples/ruby-graph/graph"

# Decent solution to squaring an adjacency list, could be improved, some edge cases that need
# to be considerd

module SquareGraph
  extend self

  def initialize_search(graph)
    @processed = []
    @discovered = []
    @parent = []
    1.upto(graph.nvertices) do |i|
      @processed[i] = @discovered[i] = false
      @parent[i] = -1
    end
  end

  def bfs(graph, start)
    queue = []
    queue.unshift start
    @discovered[start] = true
    while queue.any?
      v = queue.shift
      @processed[v] = true
      p = graph.edges[v]
      while p
        y = p.y
        if !@processed[y] || graph.directed
        end
        if !@discovered[y]
          queue.push y
          @discovered[y] = true
          @parent[y] = v
        end
        p = p.next
      end
      p "For #{v} queue = #{queue}"
      process_vertex_late(graph, v, queue)
    end
  end

  def process_vertex_late(graph, v, queue)
    # Add an edge between those currently in the queue and the current vertex's parent
    if @parent[v] != -1
      queue.each do |y|
        insert_edge(graph, @parent[v], y, false)
      end
    end
  end
end

puts "Wanna see the adjacency list answer? y/n"
if gets.chomp == "y"
  g = Graph.new
  initialize_graph(g, false)
  puts "Make a graph that is acyclic"
  read_graph(g, false)
  print_graph(g)

  extend SquareGraph
  initialize_search(g)
  bfs(g, 1)
  print_graph(g)
end


matrix = []
matrix[0] = nil
matrix[1] = [nil, 0, 1, 0]
matrix[2] = [nil, 1, 0, 1]
matrix[3] = [nil, 0, 1, 0]

p matrix

def square_for_vertices_below(matrix, x, y)
  p "HEllo with #{x} and #{y}"
  x.downto(1) do |i|
    next if i == y || i == x
    p "Checking  #{i} #{y} #{matrix[i][x]}"
    matrix[i][y] = 1
    matrix[y][i] = 1
  end
end

1.upto(3) do |i|
  1.upto(3) do |j|
    if matrix[i][j] == 1
      square_for_vertices_below(matrix, i, j)
    end
  end
end

p matrix

