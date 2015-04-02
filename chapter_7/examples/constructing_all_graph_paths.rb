require_relative "../../chapter_5/examples/ruby-graph/graph"
module Paths
  def prepare(graph)
    @solution_count = 0
    @graph = graph
  end

  def backtrack(a, k, input)
    c = []
    n_candidates =  0
    if is_a_solution?(a, k, input)
      process_solution(a, k)
    else
      k += 1
      n_candidates = construct_candidates(a, k, input, c)
      0.upto(n_candidates - 1) do |i|
        a[k] = c[i]
        backtrack(a, k, input)
        return if @finished
      end
    end
  end

  def is_a_solution?(a, k, n)
    a[k] == n
  end

  def construct_candidates(a, k, n, c)
    in_sol = []
    1.upto(k-1) do |i|
      in_sol[a[i]] = true if a[i]
    end
    n_candidates = 0
    last = nil
    
    if k == 1
      c[0] = 1
      n_candidates = 1
    else
      n_candidates = 0
      last = a[k-1]
      p = @graph.edges[last]
      while p
        unless in_sol[p.y]
          c[n_candidates] = p.y
          n_candidates += 1
        end
        p = p.next
      end
    end
    n_candidates
  end

  def process_solution(a, k)
    @solution_count += 1
  end

end

extend Paths
g = Graph.new
read_graph(g, false)
print_graph(g)
puts "Give me a destination"
n = gets.chomp.to_i
a = []
prepare(g)
backtrack(a, 0, n)
puts "There are #{@solution_count} paths from 1 to #{n}"

