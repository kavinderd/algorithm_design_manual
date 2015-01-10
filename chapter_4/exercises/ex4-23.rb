# Exercise 4-23
### Problem ###
# We seek to sort a sequence S of n integers with many duplications, such that the number of distinct integers
# in S is O(logn). Give an O(nloglogn) wort-case time algorithm to sort such sequences.
### End ###
# 
# This problem is fairly simple to solve if we use a balanced binary search tree. As we know there are numerous duplicates
# we can add a counter to each node and increment the counter as we find similar values that already exist in the tree.
# Then we only need to traverse the tree in order and we would have a sorted sequence. Since the number of distinct elements
# is in fact log n the normal O(nlogn) for sorting via a binary search would actually take O(nloglogn) since we are
# comparing all n items against the log of the distinct number of elements, logn

class Node
  attr_accessor :counter, :left_child, :right_child
  attr_reader :value 
  def initialize(value)
    @value = value
    @counter = 1
  end
end

class BST
  
  def insert(item)
    if @root
      current = @root
      parent = nil
      while current
        parent = current
        if current.value == item.value
          current.counter += 1
          break
        elsif current.value > item.value
          current = current.left_child
          unless current
            parent.left_child = item
            break
          end
        elsif current.value < item.value
          current = current.right_child
          unless current
            parent.right_child = item
            break
          end
        end
      end
    else
      @root = item
    end
  end

  def inorder_traverse
    result = []
    inorder(@root, result)
    result
  end

  def inorder(node, result)
    return unless node
    inorder(node.left_child, result)
    result << node.value
    inorder(node.right_child, result)
  end

end

def distinct_sort(array)
  bst = BST.new
  array.each do |val|
    node = Node.new(val)
    bst.insert(node)
  end
  bst.inorder_traverse
end

array = [5,2,1,2,2,2,7,5,6,8,5,4,2,4,8,9,1,2,8,4]
p "Resulting distinct sort = #{distinct_sort(array)}"
