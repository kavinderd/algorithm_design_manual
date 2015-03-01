module TopSort

  def initialize_search(g)
    @sorted_stack = []
    super
  end

  def top_sort(g)
    1.upto(g.nvertices) do |i|
      if @discovered[i] == false
        dfs(g, i)
      end
    end
    p @sorted_stack
  end

  def process_vertex_late(v)
    @sorted_stack.push v
  end

  def process_edge(x,y)
    if edge_classification(x,y) == :back
      puts "Warning: directed cycle found, not a DAG"
    end
  end
end
