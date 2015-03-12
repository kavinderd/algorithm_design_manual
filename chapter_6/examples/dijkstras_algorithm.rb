module Dijkstras
  MAX_INT = 9999

  def dijkstra(graph, start)
    in_tree  = []
    distance = []
    parent = []
    1.upto(graph.nvertices) do |i|
      in_tree[i] = false
      distance[i] = MAX_INT
      parent[i] = -1
    end

    distance[start] = 0 
    v = start

    until in_tree[v]
      in_tree[v] = true
      p = graph.edges[v]
      while p
        weight = p.weight
        w = p.y
        if distance[w] > distance[v] + weight
          distance[w] = distance[v] + weight
          parent[w] = v
        end
        p =p.next
      end
      v = 1
      dist = MAX_INT
      1.upto(graph.nvertices) do |i|
        if !in_tree[i] && dist > distance[i]
          dist = distance[i]
          v = i
        end
      end
    end

    1.upto(graph.nvertices) do |i|
      if parent[i] > -1
        puts "To #{i} cost was #{distance[i]} from #{start}"
      end
    end
  end

end
