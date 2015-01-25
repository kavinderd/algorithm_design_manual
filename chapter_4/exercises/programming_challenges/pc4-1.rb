# Programming Challenge 4-1 "Vito's Family"
#
# Sample Input
# 2 ( Number of test cases)
# 2 2 4 ( 1st = number of relatives, remaining is the street numbers)

test_cases = gets.chomp.to_i
test_cases.times do
  streets = gets.chomp.split.map { |char| char.to_i}
  streets.shift
  streets.sort!
  puts streets[streets.size/2]
end
