# Exercise 5-9
### Problem ###
# Suppose an arithmetic expression is given as a tree. Each leag is an integer and each internal node is one of the standard arithmetical
# operations. Give an O(n) algorithm for evaluating such an expression, where there are n nodes in the tree.
### End ###

class Node < Struct.new(:value, :left_child, :right_child); end;

three = Node.new(3)
four = Node.new(4)
multi = Node.new("*", three, four)
five = Node.new(5)
divide = Node.new("/", multi, five)
two = Node.new(2)
add = Node.new("+", two, multi)
root = Node.new("+", divide, add)

def postorder(node, stack)
  return unless node
  postorder(node.left_child, stack)
  postorder(node.right_child, stack)
  if node.value.kind_of?(Fixnum)
    stack.push node.value
    p stack
    stack
  else
    operation = node.value
    num2 = stack.pop
    num1 = stack.pop
    new_val = num1.send(operation, num2)
    stack.push new_val
    p stack
    stack
  end
end

require 'pry-byebug'
answer = postorder(root, [])
p answer.first
