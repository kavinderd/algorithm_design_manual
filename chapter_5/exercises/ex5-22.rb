# Exercise 5-22
### Problem ###
# Design a linear-time algorithm to eliminate each vertex v of degree 2 from a graph by replacing edges (u,v) and (v,w) by an edge 
# (u,w). We also seek to eliminate multiple copies of edges by replacting them with a single edge. Note that removing multiple
# copies of an edge may create a new vertex of degree 2, which has to be removed, and that removing a vertex of degree 2 may 
# create multiple edges, which also must be removed.
### End ### 

require_relative "../examples/ruby-graph/graph"
require_relative "../examples/ruby-graph/bfs"

g = Graph.new
read_graph(g, false)

module Remove2

  def remove_edge(graph, x, y, directed)
    edge = graph.edges[x]
    until edge.y == y
      prev = edge
      edge = edge.next
    end
    if prev && edge.next
      prev.next = edge.next
    elsif prev
      prev.next = nil
    elsif edge.next
      graph.edges[x] = edge.next
    end
    if directed == false
      remove_edge(graph, y,x, true)
    end
  end

  def edge_between?(graph,x,y)
    edge = graph.edges[x.y]
    edged = false
    while edge
      if edge.y == y.y
        edged = true
      end
      edge = edge.next
    end
    edged
  end

  def remove_2_degree_verts(graph)
    @to_remove = []
    @removed = []
    @degree_count = [0] * (graph.nvertices + 1)
    1.upto(graph.nvertices) do |i|
      edge = graph.edges[i]
      while edge
        @degree_count[i] += 1
        edge = edge.next
      end
      if @degree_count[i] == 2
        @to_remove << i
      end
    end
    p @degree_count
    while @to_remove.any?
      p "Shifting"
      v = @to_remove.shift
      if @degree_count[v] == 2
        u = graph.edges[v]
        w = u.next
        remove_edge(graph, v, u.y, false)
        remove_edge(graph, v, w.y, false)
        @removed << v
        if !edge_between?(graph, u,w)
          insert_edge(graph, u.y,w.y, false)
        end
        if @degree_count[u.y] == 2
          @to_remove << u.y
        end
        if @degree_count[w.y] == 2
          @to_remove << w.y
        end
      end
    end
    p @removed
  end
end

extend Remove2

remove_2_degree_verts(g)
