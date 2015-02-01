require_relative "graph"
require_relative "bfs"
require_relative "dfs"
require_relative "bipartite"
require_relative "top_sort"
extend BFS
g = Graph.new
puts "Is this a directed graph? 'y' or 'n'"
directed = gets.chomp == 'y' ? true : false
read_graph(g, directed)
print_graph(g)
initialize_search(g)
puts "Let's do a Breadth First Search"
puts "What vertex should we start at? (0 to skip)"
vertex = gets.chomp.to_i
bfs(g, vertex) unless vertex == 0
puts "Cool"
puts "Now lets find a path back to that vertex from anyone of the visited nodes"
puts "Give me a vertex other than the one we started at (0 to skip):"
other = gets.chomp.to_i
find_path(vertex, other) unless other == 0
puts "Interesting, huh?"
puts "Want to see the connected components of this graph? 'y' or 'n'"
connected_components(g) if gets.chomp == 'y'
puts ""
puts "Now lets add some color to our lives"
extend Bipartite
two_color(g)
extend DFS
puts ""
puts "Now for a Depth First Search"
puts "What vertex should we start at? (0 to skip)"
vertex = gets.chomp.to_i
initialize_search(g)
dfs(g, vertex) unless vertex == 0
extend TopSort
puts ""
puts "Now would you like a Topological Sort? 'y' or 'n'"
initialize_search(g)
top_sort(g) if gets.chomp == 'y'

