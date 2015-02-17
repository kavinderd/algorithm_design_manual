# Exercise 5-17
### Problem ###
# Consider the problem of determining whether a given undirected graph G = (V,E) contains a triangle or cycle of length 3
#
# a) Give an O(|v|^3) to find a triangle if one exists
# b) Improve your algorithm to run in time O(V * E).
### End ###
#
# The solution for a is rather simple. For every vertex v, iterate over its adjacent vertices w then iterate x's adjacent vertices x. If any of x's neighbors is v we have 
# a triangle.

puts "Part A"

require_relative "../examples/ruby-graph/graph"
require 'pry-byebug'
g = Graph.new
read_graph(g, false)
print_graph(g)

def find_triangle(g)
  has_triangle = false
  1.upto(g.nvertices) do |i|
    p = g.edges[i]
    while p 
      unless g.edges[p.y].y == i
        p2 = g.edges[p.y]
        while p2
          p3 = g.edges[p2.y]
          while p3
            has_triangle = true and break if p3.y == i          
            p3 = p3.next
          end
          p2= p2.next
        end
      end
      p = p.next
    end
  end
  has_triangle
end

p find_triangle(g)

puts "Part B"
g = Graph.new
read_graph(g, false)
print_graph(g)
require_relative "../examples/ruby-graph/dfs"
require_relative "../examples/ruby-graph/bfs"
extend BFS
module DFS
  def process_edge(x,y)
    cat = edge_classification(x,y)
    if cat == :back && @time - @entry_time[y] == 2
      puts "Found Triangle Between from #{x} to #{y}"
    end
  end
end

extend DFS

initialize_search(g)
dfs(g, 1)
