# Exercise 5-10
### Problem ###
# Suppose an arithmetic expression is given as a DAG (directed acyclic graph) with common subexpressions removed. Each leage is an integer and each
# internal node is one of the standard arithmetical operations. Hint: modify an algorithm for the tree case to achieve the desired efficiency
### End ###
# A way to solve this, similar to the binary tree, would be to conduct a DFS of the graph and store the value
# of an operation in the respective operations vertex. This way when a vertex is encountered that has already been processed
# we only need to get the value and not traverse the node again.

require_relative "../examples/ruby-graph/graph"

module Arithmetic

  extend self

  def initialize_search(graph)
    @processed = []
    @discovered = []
    @parent = []
    1.upto(graph.nvertices) do |i|
      @processed[i] = @discovered[i] = false
      @parent[i] = -1
    end
    @result = []
    @stack = []
  end

  def set_values(values)
    @value = values
  end


  def dfs(g, v)
    return if @finished
    @discovered[v] = true
    process_vertex_early(v)

    p = g.edges[v]
    while p
      y = p.y
      if !@discovered[y]
        @parent[y] = v
        process_edge(v,y)
        dfs(g,y)
      elsif !@result[y] && @value[y].kind_of?(String)
        process_edge(v,y)
      elsif @result[y]
        @stack.push @result[y]
      end
      return if @finished
      p = p.next
    end
    process_vertex_late(v)
    @processed[v] = true
  end

  def process_edge(x,y)
    if @value[y].kind_of? Fixnum
      @stack.push @value[y]
    end
  end

  def process_vertex_late(v)
    if @value[v].kind_of? String
      if @stack.count > 1
        operation = @value[v]
        num2 = @stack.pop
        num1 = @stack.pop
        new_val = [num1, num2].max.send(operation, [num1, num2].min)
        @result[v] = new_val
        @stack.push new_val
      end
    end
  end

  def result
    @result[1]
  end


end

extend DFS
extend Arithmetic

g = Graph.new
initialize_graph(g, true)
read_graph(g, true)
set_values([nil, '+', '+', '/', 2, '*', 5, 3, 4])
initialize_search(g)
dfs(g,1)
p result
