# Exercise 5-5
### Problem ###
# Give a linear algorithm to compute the chromatic number of graphs where each vertex has degree at most 2. Must such graphs be bipartite
### End ###
# 
# Given the graph
#        A------C
#        |      |    
#        |      |  
#        B------D
# 
# Finding the chromatic number involes counting the number of unique colors required to color the graph such that no adjacent vertices are 
# of the same color. With the example graph, the chromatic number is 2
#
# A - White
# C - Black
# B - Black
# D - White
#
# However if we were to add one additional edge between A and D our chromatic number would increase to 3 as we face a scenario
# that two Whites would be touching.
#
# So, the chromatic number seems to be related more to the number of edges than the number of vertices. This plainly disproves any notion that a 
# max two-degree graph must be bipartite.
#
# To find the chromatic number of a graph we can follow the following algorithm:
# - Mark the starting point x White
# - Run a BFS
# - Mark all discovered vertices adjacent to x as Black
# - Mark all unprocessed vertices of the Black vertices to White
# - Mark all processed vertices of the Blacks to Yellow
#
# A shorter algorithm that is applicable because we know the highest degree is:
#  - If the number of edges is odd = tripartite, even = bipartite

require_relative '../examples/ruby-graph/graph'

module ChromaticCalc
  extend self
  UNCOLORED = nil
  WHITE = 0
  BLACK = 1
  YELLOW = 2

  def initialize_search(graph)
    @color = []
    @unique_colors = []
    puts "HERE"
    super
  end

  def find_chromatic_number(graph)
    @chromatic_number = 1
    initialize_search(graph)
    1.upto(graph.nvertices) do |i|
      @color[i] = UNCOLORED
    end
    1.upto(graph.nvertices) do |i|
      if !@discovered[i]
        @color[i] = WHITE
        @unique_colors << WHITE
        bfs(graph, i)
      end
    end
    @unique_colors.count
  end

  def process_edge(x,y)
    super
    if @color[x] == @color[y] 
      puts "Increasing chromatic number"
      @color[y] = set_new_color
      @chromatic_number += 1
    elsif @color[y] == UNCOLORED
      puts "Increasing chromatic number" if @unique_colors.count == 1
      @color[y] = complement(@color[x])
    end
  end

  def set_new_color
    color = ([WHITE, BLACK, YELLOW] - @unique_colors).first
    @unique_colors << color
    color
  end

  def complement(color)
    c = color == WHITE ? BLACK : WHITE
    @unique_colors << c unless @unique_colors.include? c
    c
  end
end

extend BFS
extend ChromaticCalc

g = Graph.new
puts "Is this a directed graph? 'y' or 'n'"
directed = gets.chomp == 'y' ? true : false
puts "Remember no vertex can have a degree over two for this to work"
read_graph(g, directed)
print_graph(g)
puts "Lets calculate the chromatic number"
puts "CHROMATIC NUMBER = #{find_chromatic_number(g)}"
