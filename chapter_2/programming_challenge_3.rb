module ProgrammingChallenges
  module LightMoreLight
    def self.is_it_on(n)
      on = true
      2.upto(n - 1) do |i|
        if n % i == 0
          on = false
          break
        end
      end
      puts on
    end
  end
end


ProgrammingChallenges::LightMoreLight.is_it_on 3

ProgrammingChallenges::LightMoreLight.is_it_on 6241

ProgrammingChallenges::LightMoreLight.is_it_on 8191
