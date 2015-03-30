module Subsets
  def prepare
    @finished = false
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
    k == n
  end

  def construct_candidates(a, k, n, c)
    c[0] = true
    c[1] = false
    n_candidates = 2
  end

  def process_solution(a, k)
    print "{" 
    1.upto(k) do |i|
      print " #{i}" if a[i]
    end
    print " }\n"
  end

  def generate_subsets(n)
    a = []
    backtrack(a, 0, n)
  end
end

extend Subsets
puts "Give me an n"
n = gets.chomp.to_i
generate_subsets(n)
