# Programming Challenge 4-5
# Shell Sort

def to_top(array, index)
  tmp = array[index]
  index.downto(1) do |i|
    array[i] = array[i-1]
  end
  array[0] = tmp
end

def order_array(array, ordered)
 j = array.size - 1
 while j > 0
   if array[j] != ordered[j]
     puts "Putting #{array[j]} to the top"
     to_top(array, j)
   else
     j -= 1
   end
 end
 p array
end

array = [
  "Yertle",
  "Duke of Earl",
  "Sir Lancelot",
  "Elizabeth Windsor",
  "Michael Eisner",
  "Nixon",
  "Rogers",
  "Perfect",
  "Mack"
]

order = [
  "Yertle",
  "Nixon",
  "Sir Lancelot",
  "Duke of Earl",
  "Elizabeth Windsor",
  "Michael Eisner",
  "Rogers",
  "Perfect",
  "Mack"
]

order_array(array, order)
