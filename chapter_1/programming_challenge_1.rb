# The 3n + 1 Problem

module ProgrammingChallenges

  extend self

  def max_cycle_in_range(low,high)
    range = (low..high)
    cycles = 0
    range.each do |i|
      cycle_num = algorithm_cycles(i)
      cycles = cycle_num if cycles < cycle_num
    end
    cycles
  end

  def algorithm_cycles(i)
    count = 0
    while i > 1
      if i % 2 == 0 
        i = (i/2)
      else
        i = 3*i + 1
      end
      count +=1
    end
    count
  end
end


cycles = ProgrammingChallenges.max_cycle_in_range(5,50)
puts "Max = #{cycles}"

cycles = ProgrammingChallenges.max_cycle_in_range(500,700)
puts "Max = #{cycles}"
