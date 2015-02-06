# Exercise 5-7
### Problem ###
# Given a pre-order and in-order traversals of a binary tree, is it possible to reconstruct the tree?
# If so, sketch an algorithm to do it. If not, give a counterexample. Repeat the problem if you are
# given the pre-order and post-order traversal.
### End ####
# 
# Given the following tree
#
#                4
#         2            6
#     1      3     5     7
#
# Pre-order: 4 2 1 3 6 5 7
# In-order: 1 2 3 4 5 6 7
# Post-order 1 3 2 5 7 6 4
#
# To reconstruct the binary tree from only the pre and in order traversals the following algorithm can
# be used recursively.
#
# 1. Find the root at the head of the preorder.
# 2. Find the position of that root in the in-order, giving you the contents of the left and right subtrees
# 3. if the subtrees are greater than 1 repeat step 1 recursively.
#
# To reconstruct the binary tree from the pre and post order traversals the following algorithm can
# be used recursively
#
# 1. Find the left most node in the postorder
# 2. Find the parent of that node as the one preceding in the preorder
# 3. Find the rightmost in the post order as the one preceding the parent in the postorder
# 4. Repeat step 2 to find the parent of the parent
require 'pry-byebug'
class Node < Struct.new(:key, :value, :right_child, :left_child); end;
class Tree
  attr_reader :root

  def insert(key, value)
    node = Node.new(key, value)
    if @root
      current = @root
      parent = nil
      loop do
        parent = current
        if key < current.key
          current = current.left_child
          unless current
            parent.left_child = node
            break
          end
        else
          current = current.right_child
          unless current
            parent.right_child = node
            break
          end
        end
      end
    else
      @root = node
    end
  end

  def traverse(type)
    result = []
    case type
    when :preorder
      preorder(@root, result)
    when :inorder
      inorder(@root, result)
    when :postorder
      postorder(@root, result)
    end
  end

  private

  def preorder(node, result)
    return unless node
    result << node
    preorder(node.left_child, result)
    preorder(node.right_child, result)
  end

  def inorder(node, result)
    return unless node
    inorder(node.left_child, result)
    result << node.value
    inorder(node.right_child, result)
  end

  def postorder(node, result)
    return unless node
    postorder(node.left_child, result)
    postorder(node.right_child, result)
    result << node.value
  end
end


def reconstruct_pre_in(pre_order,in_order)
  if pre_order.size == 1
    root = Node.new(pre_order.first)
  elsif pre_order.size >= 1
    root = pre_order.shift
    index = in_order.find_index(root)
    pre_left = pre_order.slice(0...index)
    pre_right = pre_order.slice(index..-1)
    in_order_left = in_order.slice(0...index)
    in_order_right = in_order.slice(index+1..-1)
    root = Node.new(root)
    root_index = in_order.find(root)
    root.left_child = reconstruct_pre_in(pre_left, in_order_left)
    root.right_child = reconstruct_pre_in(pre_right, in_order_right)
    root
  end
end
 
def reconstruct_pre_post(pre_order, post_order, start, stop, left_child = nil)
  if stop - start == 0 && !left_child
    node = Node.new(post_order[stop])
  else
    if start == post_order.size - 1
      left_child
    else
      left_child = left_child || Node.new(post_order[start])
      parent_in = pre_order.find_index(left_child.key) - 1
      parent = Node.new(pre_order[parent_in])
      parent.left_child = left_child
      post_start = start + 1
      post_end = post_order.find_index(parent.key) - 1
      parent.right_child = reconstruct_pre_post(pre_order, post_order, post_start, post_end)
      if pre_order[post_end - 1] > parent.key
        # We still can go up higher
        reconstruct_pre_post(pre_order, post_order, post_end + 1, post_order.size - 1, parent)
      else
        parent
      end
    end
  end
end

def in_order(root)
  return unless root
  in_order(root.left_child)
  p root.key
  in_order(root.right_child)
end


pre_ord = [4, 2, 1, 3, 6, 5, 7]
in_ord  = [1,2,3,4,5,6,7]
post_ord = [ 1, 3, 2, 5,7, 6, 4]
puts "Reconstructing from pre and in order"
root = reconstruct_pre_in(pre_ord.dup, in_ord.dup)

in_order(root)

puts "Reconstructing from pre and post order"
root = reconstruct_pre_post(pre_ord, post_ord, 0, pre_ord.size - 1)
in_order(root)

