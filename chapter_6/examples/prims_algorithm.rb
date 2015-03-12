module Prims
  MAX_INT = 999999

  def prim(graph, start)
    counter = 0
    in_tree = []
    distance = []
    parent = []
    1.upto(graph.nvertices) do |i|
      in_tree[i] = false
      distance[i] = MAX_INT
      parent[i] = -1
    end
    distance[start] = 0
    v = start
    until (in_tree[v])
      in_tree[v] = true
      p = graph.edges[v]
      while p
        w = p.y
        weight = p.weight
        if (distance[w] > weight) && !in_tree[w]
          distance[w] = weight
          parent[w] = v
        end
        p = p.next
      end
      v = 1
      dist = MAX_INT
      1.upto(graph.nvertices) do |i|
        if !in_tree[i] && (dist > distance[i])
          dist = distance[i]
          v = i
        end
      end
    
    end
    1.upto(graph.nvertices) do |i|
      if parent[i] > -1
        puts "To #{i} cost was #{distance[i]} from #{parent[i]}"
      end
    end
  end
end
