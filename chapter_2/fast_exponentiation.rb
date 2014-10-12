module Algorithms
  extend self

  def slow_power(a, n)
    result = a
    (n-1).times do
      result = result * a
    end
    result
  end

  def fast_power(a, n)
    return 1 if n == 0
    result = fast_power(a, n/2)
    if n % 2 == 0
      return result ** 2
    else
      return a * (result ** 2)
    end
    result
  end
end

a = 2
n = 500000

t = Time.now
Algorithms.slow_power(a, n)
e = Time.now
puts "Slow power took #{e-t} seconds"

t = Time.now
Algorithms.fast_power(a, n)
e = Time.now
puts "Slow power took #{e-t} seconds"

