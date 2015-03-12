module BFS
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
      process_vertex_early(v)
      @processed[v] = true
      p = graph.edges[v]
      while p
        y = p.y
        if !@processed[y] || graph.directed
          process_edge(v, y)
        end
        if !@discovered[y]
          queue.push y
          @discovered[y] = true
          @parent[y] = v
        end
        p = p.next
      end
      process_vertex_late(v)
    end
  end

  def find_path(first, last)
    if(first==last || last == -1)
      puts "first: #{first}"
    else
      find_path(first, @parent[last])
      puts "then: #{last}"
    end
  end

  def connected_components(g)
    initialize_search(g)
    c= 0
    1.upto(g.nvertices) do |i|
      if !@discovered[i]
        c += 1
        puts "Component: #{c}"
        bfs(g, i)
      end
    end
  end


  def process_vertex_late(v)
  end

  def process_vertex_early(v)
    puts "processed vertex #{v}"
  end

  def process_edge(x, y)
    puts "Processing #{x} #{y}"
  end

end

