module Permutations
  MAX = 10000
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
    in_perm =[false] * MAX
    0.upto(k-1) do |i|
      in_perm[a[i]] = true if a[i]
    end
    candidate_count = 0
    1.upto(n) do |i|
      unless in_perm[i]
        c[candidate_count] = i
        candidate_count += 1
      end
    end
    candidate_count
  end

  def process_solution(a, k)
    print "{" 
    1.upto(k) do |i|
      print " #{a[i]}"
    end
    print " }\n"
  end

  def generate_subsets(n)
    a = []
    backtrack(a, 0, n)
  end
end

extend Permutations
puts "Give me an n"
n = gets.chomp.to_i
generate_subsets(n)
