# Problem: Given a set of points find the optimal path to travel amongst all points to reduce total time
# Input: List of points
# Output: The order in which the points were reached
module Algorithms
  extend self 

  def nearest_neighbor(p)
    max = p.length
    visited = [p.first]   
    p.delete(p.first)
    while visited.length < max - 1
      next_p = closest_point(visited[-1],p)
      visited << next_p
      p.delete(next_p)
    end      
    visited
  end

  def closest_point(p, list)
    dist = 999999999999999
    chosen_one = 0
    list.each do |num|
      if (p - num).abs < dist
        dist = (p - num).abs
        chosen_one = num
      end
    end
    chosen_one    
  end

end
