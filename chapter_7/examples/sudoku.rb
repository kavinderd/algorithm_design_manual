class Point < Struct.new(:x, :y); end;
class BoardType < Struct.new(:matrix, :freecount, :move); end;
require "pry-byebug"
module SudokuSolver
  DIMENSION = 9
  BASED = 3
  NCELLS = DIMENSION * DIMENSION


  def backtrack(a, k, input)
    c = []
    n_candidates =  0
    if is_a_solution?(a, k, input)
      process_solution(a, k,input)
    else
      k += 1
      n_candidates = construct_candidates(a, k, input, c)
      0.upto(n_candidates - 1) do |i|
        a[k] = c[i]
        make_move(a, k, input)
        backtrack(a, k, input)
        unmake_move(a, k, input)
        return if @finished
      end
    end
  end

  def is_a_solution?(a, k, board)
    board.freecount == 0
  end

  def construct_candidates(a, k, board, c)
    possible = []
    x,y = next_square(board)
    board.move[k] = Point.new unless board.move[k]
    board.move[k].x = x
    board.move[k].y = y
    n_candidates = 0

    return 0 if x < 0 && y < 0
    possible_values(x, y, board, possible)
    1.upto(DIMENSION) do |i|
      if possible[i]
        c[n_candidates] = i
        n_candidates += 1
      end
    end
    n_candidates
  end

  def make_move(a, k, board)
    fill_square(board.move[k].x, board.move[k].y, a[k], board)
  end

  def unmake_move(a, k, board)
    free_square(board.move[k].x, board.move[k].y, board)
  end

  def process_solution(a, k, board)
    print_board(board)
    @finished = true 
  end

  def possible_values(x, y, board, possible)
    init = false
    if board.matrix[x][y] != 0 || ( x < 0 || y < 0)
      init = false
    else
      init = true
    end

    1.upto(DIMENSION) do |i|
      possible[i] = init
    end

    0.upto(DIMENSION - 1) do |i|
      if board.matrix[x][i] != 0
        possible[board.matrix[x][i]] = false
      end
    end

    0.upto(DIMENSION - 1) do |i|
      if board.matrix[i][y] != 0
        possible[board.matrix[i][y]] = false
      end
    end


    xlow = BASED * ((x/BASED))
    ylow = BASED * ((y/BASED))
    xlow.upto(xlow + BASED - 1) do |i|
      ylow.upto(ylow + BASED - 1) do |j|
        if board.matrix[i][j] != 0
          possible[board.matrix[i][j]] = false
        end
      end
    end
  end

  def possible_count(x, y, board)
    possible = []
    possible_values(x,y, board, possible)
    count = 0
    0.upto(DIMENSION) do  |i|
      if possible[i] 
        count += 1
      end
    end
    count
  end

  def fill_square(x, y, v, board)
    if board.matrix[x][y] == 0
      board.freecount -= 1
    else
      p "Warning: filling already filled square #{x}, #{y} current value = #{board.matrix[x][y]}"
    end
    board.matrix[x][y] = v
  end

  def free_square(x, y, board)
    if board.matrix[x][y] != 0
      board.freecount += 1
    else
      p "Warning: freeing already empty square #{x} #{y}"
    end
    board.matrix[x][y] = 0
  end

  def next_square( board)
    best_count = DIMENSION + 1
    doomed = false
    x = y = -1
    0.upto(DIMENSION - 1) do |i|
      0.upto(DIMENSION - 1) do |j|
        new_count = possible_count(i, j, board)
        if new_count == 0 && board.matrix[i][j] == 0
          doomed = true
        end
        if new_count < best_count && new_count >= 1
          best_count = new_count
          x = i
          y = j
        end
      end
    end
    if doomed
      x = y = -1
    end
    [x,y]
  end

  def print_board(board)
    p "There are #{board.freecount} free board positions"

    0.upto(DIMENSION - 1) do |i|
      0.upto(DIMENSION - 1) do |j|
        if board.matrix[i][j] == 0
          print "0"
        else
          print "#{board.matrix[i][j]}"
        end

        if ( j + 1 ) % BASED == 0
          print "|"
        end
      end
      print "\n"
      if ( i + 1) % BASED == 0
        0.upto(DIMENSION + BASED - 2) do |j|
          print "-"
        end 
        print "\n"
      end
    end
  end

  def init_board(board)
    0.upto(DIMENSION - 1) do |i|
      0.upto(DIMENSION - 1) do |j|
        board.matrix[i][j] = 0
      end
    end
    board.freecount = NCELLS
  end

  def read_board(board)
    init_board(board)
    0.upto(DIMENSION - 1) do |i|
      0.upto(DIMENSION - 1) do |j|
        value = gets.chomp.to_i
        if value != 0
          fill_square(i, j, value, board)
        end
      end
    end
  end

end

extend SudokuSolver

move = []
matrix = [[]] * 9
matrix = Array.new(9)
0.upto(8) { |i| matrix[i] = Array.new(9) }
board = BoardType.new(matrix, 0, move)
puts "ENTER BOARD INFORMATION"
read_board(board)
print_board(board)

print "------------\n"
a = []
backtrack(a,0, board)
