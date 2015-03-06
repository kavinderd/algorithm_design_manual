# Programming Challenge 5-2
# Playing With Wheels
#
# Sample Input 
# 2
# 8056
# 6508
# 5
# 8057
# 8047
# 5508
# 7508
# 6408

require "pry-byebug"

def build_possibilities(number, queue)
  4.times do |i|
    s = number.dup
    s[i] = s[i].to_i == 9 ? "0" : (s[i].to_i + 1).to_s
    queue << s
  end
  4.times do |i|
    s = number.dup
    s[i] = s[i].to_i == 0 ? "9" : (s[i].to_i - 1).to_s
    queue << s
  end
end

test_cases = gets.chomp.to_i
test_cases.times do

  initial = gets.chomp
  target = gets.chomp
  forbidden_count = gets.chomp.to_i
  @visited = []
  forbidden_count.times do 
    number = gets.chomp
    @visited[number.to_i] = true
  end

  @done = false
  @steps = []
  @steps[initial.to_i] = 0
  @min_steps = -1
  queue = []
  queue.unshift initial
  while queue.any?
    diff_pos = 0
    current = queue.shift
    diff_pos.upto(3) do |i|
      if current[i].to_i != target[i].to_i
        diff_pos = i
        break
      end
    end
    @visited[current.to_i] = true
    neighbors = []
    build_possibilities(current, neighbors)
    choice = nil
    neighbors.each do |number|
      if @visited[number.to_i] == true
      elsif number.to_i == target.to_i
        @min_steps = @steps[number.to_i] = @steps[current.to_i] + 1
        @done =true
        break
      else
        if (target[diff_pos].to_i - number[diff_pos].to_i).abs < (target[diff_pos].to_i - current[diff_pos].to_i).abs
          choice =number
        end
      end
    end
    break unless choice
    queue.push choice
    @steps[choice.to_i] = @steps[current.to_i] + 1
  end
  puts @min_steps
end
