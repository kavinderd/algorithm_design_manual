module Bipartite 
  extend self
  UNCOLORED = nil
  YELLOW = "yellow"
  GREEN = "green"
  WHITE = "white"
  BLACK = "black"

  def two_color(g)
    @color = []
    1.upto(g.nvertices) do |i|
      @color[i] = UNCOLORED
    end 
    @bipartite = true
    initialize_search(g)
    1.upto(g.nvertices) do |i|
      if !@discovered[i]
        @color[i] = YELLOW
        bfs(g, i)
      end
    end
    puts "Bipartite status: #{@bipartite}"
  end

  def process_edge(x, y)
    super
    if @color[x] == @color[y]
      @bipartite = false
      puts "Warning: not bipartite due to #{x} and #{y}"
    end
    @color[y] = complement(@color[x])
  end

  def complement(color)
    color == YELLOW ? GREEN : YELLOW
  end
end
