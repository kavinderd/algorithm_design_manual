# Exercise 5-8
### Problem ###
# Present correct and efficient algorithm to convert an undirected graph G between the following graph data structures. You must give the time complexity of each algorithm, assuming 
# n vertices and m edges.
#
# a) Convert from an adjacency matrix to adjacency lists
# b) Convert from an adjacency list to an incidence matrix
# c) Convert from an incidence matrix to adjacency lists.
### End ###

require_relative "../examples/ruby-graph/graph"
require 'pry-byebug'
def matrix_to_list(matrix)
  list = []
  g = Graph.new
  initialize_graph(g, false)
  g.nvertices = matrix.count-1
  1.upto(matrix.count-1) do |i|
    i.upto(matrix.count-1) do |j|
      if matrix[i][j] == 1
        insert_edge(g, i, j, false)
      end
    end
  end
  g
end

matrix = [nil, [nil, 0,1,1], [nil,1,0,1], [nil, 1,1,0]]
g = matrix_to_list(matrix)
print_graph(g)

def list_to_incidence_matrix(graph)
  matrix = [[]]  * (graph.nvertices + 1)
  edges = []
  1.upto(graph.nvertices) do |i|
    edge = graph.edges[i]
    while edge && i < edge.y
      x = i
      y = edge.y
      incidence = [0] * (graph.nvertices + 1)
      incidence[x] = 1
      incidence[y] = 1 
      edges << incidence
      edge = edge.next
    end
  end
  1.upto(graph.nvertices) do |i|
    matrix[i] = edges.inject([]) { |result, edge| result << edge[i] }
  end
  matrix
end

matrix = list_to_incidence_matrix(g)
1.upto(matrix.count-1) do |i|
  0.upto(matrix[i].count) do |j|
    if matrix[i][j] == 1
      puts "Edge #{j} includes #{i}"
    end
  end
end

def incidence_to_adjacency_list(matrix)
  g = Graph.new
  initialize_graph(g, false)
  g.nvertices = matrix.count-1
  edges = []
  1.upto(matrix.count-1) do |i|
    0.upto(matrix[i].count-1) do |j|
      edges[j] = [] unless edges[j]
      edges[j] << i if matrix[i][j] == 1
    end
  end
  edges.each do |pair|
    p pair
    next unless pair
    insert_edge(g, pair[0], pair[1], false)
  end
  g
end

g2 = incidence_to_adjacency_list(matrix)
print_graph(g2)
