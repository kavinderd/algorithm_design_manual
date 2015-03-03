# Exercise 5-32
### Problem ###
# Write a function to traverse binary search tree and return the 
# ith node in sorted order.
### End ###
#

def ith_largest(node, i)
  if node
    result = ith_largest(node.left_child, i)
    if result
      return result
    end
    @count += 1
    return node if @count == i
    ith_largest(node.right_child, i)
  end
end


class Node < Struct.new(:key, :value, :right_child, :left_child); end;
root = Node.new(7)
left = Node.new(5)
right = Node.new(9)
root.left_child = left
root.right_child = right
left1 = Node.new(3)
right1 = Node.new(6)
left.left_child = left1
left.right_child = right1
@count = 0
require "pry-byebug"
puts ith_largest(root, 4).key

