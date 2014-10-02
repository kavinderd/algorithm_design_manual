# Australian Voting

module ProgrammingChallenges

  extend self

  def calculate_winners(candidates, ballots)
    round_winners= []
    remaining_candidates= candidates
    results = {}
    candidates.each_with_index do |candidate, index|
      first_place = 0
      second_place = 0
      third_place = 0
      ballots.each do |ballot|
        vote = ballot[index]
        case vote
        when 1
          first_place += 1
        when 2
          second_place += 1
        when 3
          third_place += 1
        end
      end
      results[candidate] = [first_place, second_place, third_place]
    end
    winners = []
    3.times do |i|
      winners = choose_winner_for_round(results, i)
      break if winners.count == 1
    end
    puts "The winner of the election is #{winners.first}"
  end

  def choose_winner_for_round(candidates, round)
    winners = []
    winning_count = 0
    candidates.each do |candidate, votes|
      if votes[0] >= winning_count
        winning_count = votes[0]
        winners << candidate
      end
    end
    winners
  end

end

ProgrammingChallenges.calculate_winners(['Frank', 'Bob', 'Luke'], [[1,2,3], [2,3,1], [3,2,1],[1,3,2],[2,1,3]])
