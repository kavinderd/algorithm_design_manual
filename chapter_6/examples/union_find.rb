require 'pry-byebug'

class UnionSet < Struct.new(:parent, :size, :number); end;

def set_union_init(set, size)
  1.upto(size) do |i|
    set.parent[i]= i
    set.size[i] = 1
  end
  set.number = size
end

def find(set, x)
  if(set.parent[x] == x)
    x
  else
    find(set,set.parent[x])
  end
end

def union_sets(set, s1, s2)
  root1 = find(set, s1)
  root2 = find(set, s2)
  return if root1 == root2

  if(set.size[root1] >= set.size[root2])
    set.size[root1] += set.size[root2]
    set.parent[root2] = root1
  else
    set.size[root2] += set.size[root1]
    set.parent[root1] = root2
  end
end

def print_set_union(set)
  1.upto(set.number) do |i|
    puts "#{i} set=#{set.parent[i]} size=#{set.size[i]}"
  end
end

def same_component(set, s1, s2)
  find(set, s1) == find(set, s2)
end
