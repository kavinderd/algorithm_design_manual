module FloydWarshall
  
  def fw(graph)
    through_k = nil
    1.upto(graph.nvertices) do |k|
      1.upto(graph.nvertices) do |i|
        1.upto(graph.nvertices) do |j|
          through_k = graph.weight[i][k] + graph.weight[k][j]
          if through_k < graph.weight[i][j]
            graph.weight[i][j] = through_k
          end
        end
      end
    end
  end

end
