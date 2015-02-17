# Exercise 5-19
### Problem ###
# The diameter of a tree T = (V,E) is given by max d(u,v) which is the number of edges on the path from u to v. Describe an efficient
# algorithm to compute the diameter of a tree and show the coreectness and analyze the running time of your algorithm.
### End ###
# 
# The nature of a tree simplifies this problem, as the diameter of a tree would be the distance from the root to the farthest
# node. Thus to find the diameter we can run a depth first search and keep track of the greatest depth of any search.

class Node < Struct.new(:key, :value, :children); end;

root = Node.new(0)
node1 = Node.new(1)
node2 = Node.new(2)
root.children = [node1,node2]
node3 = Node.new(3)
node4 = Node.new(4)
node1.children = [node3,node4]
node5 = Node.new(5)
node2.children = [node5]
node6 = Node.new(6)
node4.children = [node6]

@diameter = 0

def find_diameter(root, diameter)
  if root.children && root.children.any?
    @diameter += 1
    root.children.each do |child|
      find_diameter(child, @diameter)
    end
    @diameter
  else
    @diameter
  end
end

puts "Diameter = #{find_diameter(root, @diameter)}"

