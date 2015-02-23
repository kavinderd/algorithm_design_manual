# Exercise 5-20
### Problem ###
# Given an undirected graph G with n vertices and m edges and an integer k,
# give an O(m + n) algorithm that finds the maximum induced subgraph H of G such 
# that each vertex in H has degree >= k or prove that no such graph exists. 
# An induced subgraph F = (U,R) of a graph G=(V,E) is a subset of U of the vertices V of G and
# all edgees R of G such that both vertices of each edge are in U.
### End ###
# 

require_relative "../examples/ruby-graph/graph"
require_relative "../examples/ruby-graph/bfs"

g = Graph.new
read_graph(g, false)


module Subgraph
  def initialize_search(graph)
    @degree_count =[0] * graph.nvertices
    @subgraphing = true
    super
  end

  def process_edge(x,y)
    @degree_count[x] += 1
  end

  def initialize_subgraph(graph)
    @induced_vertices = []
  end

  def k_core(graph, k)
    @deleted = []
    num_deleted =0
    1.upto(graph.nvertices) do |i|
      if @degree_count[i] < k
        delete_vertex(graph, i, k)
      end
    end

    sub = Graph.new
    initialize_graph(sub, false)
    deleted_count = @deleted.select { |x| x != nil }.count
    sub.nvertices = graph.nvertices
    sub.directed = false
    p sub.nvertices
    p @deleted
    1.upto(graph.nvertices) do |i|
      if(!@deleted[i])
        edge = graph.edges[i]
        while edge
          if(!@deleted[edge.y])
            p i
            insert_edge(sub, i, edge.y, true)
          end
          edge = edge.next
        end
      end
    end
    print_graph(sub)
  end

  def degree_counts(graph)
    @degree_count = [0] * (graph.nvertices + 1)
    1.upto(graph.nvertices) do |i|
      edge = graph.edges[i]
      while edge
        @degree_count[i] += 1
        edge = edge.next
      end
    end
  end

  def delete_vertex(graph, vertex, k)
    @deleted[vertex] = true
    edge = graph.edges[vertex]
    while edge
      if(!@deleted[edge.y] && @degree_count[edge.y] < k)
        delete_vertex(graph, edge.y, k)
      else
        @degree_count[edge.y] -= 1
      end
      edge = edge.next
    end
  end

end
extend BFS
extend Subgraph


degree_counts(g)
k_core(g, 3)
