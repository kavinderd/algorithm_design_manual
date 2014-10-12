module ProgrammingChallenges
  module MultiplicationGame
    def self.who_wins(number)
      p = 1
      random = number
      players = [:Stan, :Ollie].cycle
      winner = nil
      loop do
        player = players.next
        p = p * 9
        if p > random
          winner = player
          break
        end
      end 
      puts "#{winner} wins."
    end
  end
end

ProgrammingChallenges::MultiplicationGame.who_wins(162)

ProgrammingChallenges::MultiplicationGame.who_wins(17)

ProgrammingChallenges::MultiplicationGame.who_wins(3401226)

