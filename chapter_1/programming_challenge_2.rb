# The Trip

module ProgrammingChallenges

  extend self

  def calculate_trip_exchange(travellers)
    minimum = 100.00
    maximum = 0.00
    travellers.each do |amount|
      if amount < minimum
        minimum = amount
      end
      if amount > maximum
        maximum = amount
      end
    end
    maximum - minimum
  end
end


exchange = ProgrammingChallenges.calculate_trip_exchange([10.00, 20.00, 15.00, 7.00])
puts "$#{exchange} needs to exchanged"
