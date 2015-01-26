# Programming Challenge 4-3

def send_to_dest(pair, destination, target)
  destination += pair
  destination.sort!
  destination
end

def cross_bridge(members)
  destination = []
  target = members.size
  members.sort!
  time = 0
  i = 0
  loop do
    i = 0 if members[i] == nil
    pair = [members[i], members[i+1]]
    time += pair.max
    members[i], members[i+1] = nil, nil
    destination = send_to_dest(pair, destination, target)
    returner =  destination.size == target ? nil : destination.shift
    members << returner 
    members = members.reject(&:nil?).sort
    time += returner if returner
    break if destination.size == target
    i += 1
  end
  p "Took #{time} seconds"
end

puts "Crossing bridge with 1 2 5 10"
cross_bridge([1,2,5,10])
