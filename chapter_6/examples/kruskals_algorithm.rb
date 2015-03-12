require_relative "union_find"

class EdgePair < Struct.new(:x, :y, :weight); end;
module Kruskals

  def to_edge_array(graph, edge_pairs)
    m = 0
    1.upto(graph.nvertices) do |i|
      p = graph.edges[i]
      while p
        if p.y > i
          edge_pair = EdgePair.new(i, p.y, p.weight)
          edge_pairs[m] = edge_pair
          m += 1
        end
        p = p.next
      end
    end
  end 

  def weight_compare(ep1, ep2)
    if ep1.weight < ep2.weight
      -1
    elsif ep1.weight > ep2.weight
      1
    else
      0
    end
  end

  def kruskal(graph)
    set = ::UnionSet.new([],[],nil)
    edge_pairs = []
    set_union_init(set, graph.nvertices)
    to_edge_array(graph, edge_pairs)
    edge_pairs.sort! { |a,b| a.weight <=> b.weight }
    0.upto(graph.nedges - 1) do |i|
      if !same_component(set, edge_pairs[i].x, edge_pairs[i].y)
         puts "Edge #{edge_pairs[i].x}, #{edge_pairs[i].y} of weight #{edge_pairs[i].weight} in MST"
         union_sets(set, edge_pairs[i].x, edge_pairs[i].y)
      end
    end
  end

end
