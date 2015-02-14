# Exercise 5-13
### Problem ###
# A vertex cover of a graph G = (V,E) is a subset of vertices V' such that each edge in E is incident on at least on vertex 
# of V'
#
# a) Give an fficient algorithm to find a minimum-size vertex cover if G is a tree.
#
# b) Let G=(V,E) be a tree such that the weight of each vertex is equal to the degree of 
# that vertex. Give an efficient algorithm to find a minimum-wieght vertex cover of G.
#
# c) Let G=(V,E) be a tree with arbitrary weights associated with the vertices. Give an 
# efficient algorithm to find a minimum-weight vertex cover of G
### End ###

puts "Part A"
class Node < Struct.new(:key, :value, :children); end;

module VertexCover
  extend self

  def initialize_covering
    @covered = []
  end

  def cover_vertices(root)
    if root.children && root.children.any?
      @covered << root
      root.children.each { |child| cover_vertices(child) }
    end 
    @covered.map { |node| node.key }
  end

end

root = Node.new(0)
node1 = Node.new(1)
root.children = []
root.children << node1
node2 = Node.new(2)
root.children << node2
node3 = Node.new(4)
root.children << node3
node4 = Node.new(5)
node5 = Node.new(6)
node1.children = []
node1.children << node4
node1.children << node5

extend VertexCover

initialize_covering
p cover_vertices(root)

puts "Part B"

root = Node.new(3)
node1 = Node.new(3)
node2 = Node.new(5)
node3 = Node.new(1)
root.children = [node1, node2, node3]
node4 = Node.new(1)
node5 = Node.new(1)
node1.children = [node4, node5]
node6 = Node.new(3)
node7 = Node.new(1)
node8 = Node.new(1)
node9 = Node.new(1)
node2.children = [node6, node7, node8, node9]
node10 = Node.new(1)
node11 = Node.new(1)
node6.children = [node10,node11]

module VertexCover

  def minimum_weight_cover(root)
    root_weight = root.key
    child_weight = root.children.inject(0) { |result, node| result += node.key; }
    if root_weight < child_weight
      @covered << root
    else
      @covered << root.children
      @covered.flatten!
    end
    root.children.select { |child| child.key > 1 }.each { |child| minimum_weight_cover(child) }
  end

  def print_cover
    p @covered.map { |node| node.key }
  end
end

extend VertexCover
initialize_covering
minimum_weight_cover(root)
print_cover


puts "Part C"

root = Node.new(1,7)
node1 = Node.new(2,1)
node2 = Node.new(3,2)
root.children = [node1, node2]
node3 = Node.new(4,8)
node4 = Node.new(5,4)
node5 = Node.new(6,1)
node2.children = [node3, node4, node5]
node6 = Node.new(7,7)
node5.children = [node6]

module VertexCover

  def minimum_arbitrary_weight_cover(root)
    unless @covered.include?(root)
      root_weight = root.value
      child_weight = root.children.inject(0) { |result, child| result += child.value }
      if root_weight < child_weight
        @covered << root
      else
        @covered += root.children
      end
    end
    root.children.each { |child| minimum_arbitrary_weight_cover(child) if child.children } if root.children
  end
  
end

initialize_covering
minimum_arbitrary_weight_cover(root)
print_cover
