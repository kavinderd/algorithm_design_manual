# Exercise 5-16
### Problem ###
# An independent set of an undirecte graph G = (V, E) is a set of vertices U such that no edge in E is incident on
# two vertices of U.
#
# a) Give an efficient algorithm to find a maximum-size independent set if G is a tree
#
# b) Let G = (V,E) be a tree with weights associated with the vertices such that the wieght of each vertex is equal
# to the degree of that vertex. Give an efficient algorithm to find a maximum independent set of G
#
# c) Let G = (V,E) be a tree with arbitrary weights associataed with the vertices. Give an efficient algorithm to find a maximum independent
# set of G.
### End ###
#

puts "Part A"

class Node < Struct.new(:key, :value, :children, :color); end;

root = Node.new(0)
node1, node2 = [1,2].map { |num| Node.new(num) }
root.children = [node1, node2]
node3, node4, node5 = [3,4,5].map { |num| Node.new(num) }
node1.children = [node3]
node2.children = [node4, node5]
node6, node7 = [6,7].map { |num| Node.new(num) }
node3.children = [node6, node7]

module IndependentSet

  extend self

  def initialize_search
    @colors = [:red, :blue].cycle
    @color_counts = [[], []]
  end

  def find_independent_set(root)
    initialize_search
    color_nodes(root, @colors.next) 
    @color_counts[0].count > @color_counts[1].count ? @color_counts[0] : @color_counts[1]
  end

  def color_nodes(root, color)
    unless root.color
      root.color = color
      if color == :red
        @color_counts[0] << root
      else
        @color_counts[1] << root
      end
    end
    current_color = @colors.next
    root.children.each { |child| color_nodes(child, current_color) } if root.children
  end

end

extend IndependentSet

initialize_search
find_independent_set(root).each { |node| puts "Key #{node.key} Color = #{node.color}" }

puts "Part B"

module IndependentSet
  def get_heavier_set
    red_weight = @color_counts[0].inject(0) { |sum, node| sum + node.key}
    blue_weight = @color_counts[1].inject(0) { |sum, node| sum + node.key}
    if red_weight > blue_weight
      @color_counts[0]
    else
      @color_counts[1]
    end
  end
end


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

extend IndependentSet

initialize_search
find_independent_set(root)
get_heavier_set.each { |node| puts "Key/Weight #{node.key} Color = #{node.color}" }
