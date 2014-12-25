class ListItem
  attr_accessor :data, :link
end

class LinkedList
  attr_reader :start_node
  def initialize(item)
    @start_node = ListItem.new
    @start_node.data = item
  end

  def search(item)
    return start_node.data if start_node.data == item
    next_node = start_node.link
    loop do 
      if next_node.data == item
        return next_node
      else
        next_node = next_node.link
      end
    end
  end

  def insert(item)
    tmp = @start_node
    @start_node = ListItem.new
    @start_node.data = item
    @start_node.link = tmp
  end

  def delete(item)
    node = search(item)
    if node
      pred = predecessor(@start_node, item)
      if pred == nil
        #Beginning of List
        @start_node = node.link
      else 
        pred.link = node.link
      end
    end
  end
  
  def predecessor(list, item)
    return nil unless list && list.link
    if list.link.data == item
      return list
    else
      return predecessor(list.link, item)
    end 
  end

  def size
    count = 1
    n_node = @start_node.link
    while n_node do
      count += 1
      if n_node.link
        n_node = n_node.link
      else
        break
      end
    end
    count
  end
      
end


list = LinkedList.new("hello")
list.insert("goodbye")
puts list.size
list.insert("greetings")
puts list.size
list.delete("goodbye")
puts list.size


