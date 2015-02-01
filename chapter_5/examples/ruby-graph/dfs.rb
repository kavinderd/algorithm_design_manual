module DFS
  extend self

  def initialize_search(g)
    @entry_time = []
    @time = 0
    @exit_time = []
    @finished = false
    super
  end

  def dfs(g,v)
    return if @finished
    @discovered[v] = true
    @time += 1
    @entry_time[v] = @time
    process_vertex_early(v)

    p = g.edges[v]
    while p
      y = p.y
      if !@discovered[y]
        @parent[y] = v
        process_edge(v,y)
        dfs(g,y)
      elsif (!@processed[y] && @parent[v] != y) || g.directed
        process_edge(v, y)
      end
      return if @finished
      p = p.next
    end

    process_vertex_late(v)
    @time += 1
    @exit_time[v] = @time
    @processed[v] = true
  end
  
  def process_vertex_late(v)
  end

  def process_vertex_early(v)
    puts "processed vertex #{v}"
  end

  def process_edge(x, y)
    puts "Processing #{x} #{y}"
    if @discovered[y] && @parent[x] != y
      puts "Cycle from #{y} to #{x}"
      find_path(y,x)
      puts""
      @finished = true
    end
  end

  def edge_classification(x,y)
    return :tree if @parent[y] == x
    return :back if @discovered[y] && !@processed[y]
    return :forward if @processed[y] && ( @entry_time[y] > @entry_time[x])
    return :cross if @processed[y] && ( @entry_time[y] < @entry_time[x])
  end
end
