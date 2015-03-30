module Backtrack

  def backtrack(a, k, input)
    candidates = [MAXCANDIDATES]
    n_candidates = 0
    if is_a_solution?(a, k, input)
      process_solution(a, k, input)
    else
      k += 1 
      construct_candidates(a, k, input, c, n_candidates)
      0.upto(n_candidates) do |i|
        a[k] = candidates[i]
        make_move(a, k, input)
        backtrack(a, k, input)
        unmake_move(a, k, input)
        return if @finished      
      end
    end
  end
end
