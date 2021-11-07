# class that handles game state
class Board
  def initialize
    # a board contains 9 cells
    @cells = Array.new(9, &:to_s)
        @winner = '0'
    @draw = false
  end

  private

  def cell_empty(cell)
    return @cells[cell].match(/[[:digit:]]/)
  end

  def row_match?(row)
    return @cells[row*3 + 0] == @cells[row*3 + 1] && @cells[row*3 + 1] == @cells[row*3 + 2]
  end

  def column_match?(col)
    return @cells[col + 0*3] == @cells[col + 1*3] && @cells[col + 1*3] == @cells[col + 2*3]
  end

  def diag_match?
    if @cells[0] == @cells[4] && @cells[4] == @cells[8]
      return true
    elsif @cells[2] == @cells[4] && @cells[4] == @cells[6]
      return true
    else
      return false
    end
  end

  public

  # method to put symbol in cell
  def play(player, cell)
    if cell_empty(cell)
      @cells[cell] = player
    else
      puts 'Invalid move'
      return false
    end
  end

  def finished?
    # check rows and columns
    for i in (0..2)
      if row_match?(i) || column_match?(i)
        @winner = @cells[i]
        return true
      end
    end

    # now check diagonals
    if diag_match?
      @winner = @cells[4]
      return true
    end

    # check for draw
    for i in (0..8)
      return false if cell_empty(i)
    end

    if i == 8
      @draw = true
      return true
    end

    return false
  end

  def winner
    return @winner
  end

  def draw?
    return @draw
  end

  # method to print board in a pretty way for playing
  def print_board
    puts '     *     *     '
    puts "  #{@cells[0]}  *  #{@cells[1]}  *  #{@cells[2]}  "
    puts '     *     *     '
    puts '* * ** * * * * * '
    puts '     *     *     '
    puts "  #{@cells[3]}  *  #{@cells[4]}  *  #{@cells[5]}  "
    puts '     *     *     '
    puts '* * ** * * * * * '
    puts '     *     *     '
    puts "  #{@cells[6]}  *  #{@cells[7]}  *  #{@cells[8]}  "
    puts '     *     *     '
  end

  def cells=(arr)
    @cells = arr
  end
end

players = ['x', 'o']
current_player = 0

board = Board.new

# draw_state = ['x', 'o', 'x', 'o', 'x', 'x', 'o', 'x', 'o']
# board.cells = draw_state

until board.finished?
  board.print_board
  puts "#{players[current_player]}'s turn"
  cell = gets.chomp

  unless '012345678'.include? cell
    puts 'Please supply valid input [0-8]'
    next
  end

  if board.play(players[current_player], cell.to_i)
    current_player = 1 - current_player
  end
end

board.print_board
if board.draw?
  puts "It's a draw!"
else
  puts "Winner is #{board.winner}"
end
