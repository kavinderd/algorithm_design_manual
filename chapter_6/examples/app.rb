require_relative "graph"
require_relative "prims_algorithm"
require_relative "kruskals_algorithm"
require_relative "dijkstras_algorithm"

puts "Hello, and welcome to the examples of chapter 6"
g = Graph.new
extend Prims
initialize_graph(g, false)
puts "Enter graph info"
read_graph(g, false)
puts "Running Prims"
prim(g, 1)
extend Kruskals
puts "Running Kruskals"
kruskal(g)
puts "Running Dijkstras"
extend Dijkstras
dijkstra(g, 1)

