class TicTacToe
  def initialize(board = nil)
    @board = (board || Array.new(9, " "))
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(position, value)
  @board[position] = value
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  !position_taken?(index) && index.between?(0,8)
end

def turn_count
  counter = 0
  @board.each do |board_space|
    board_space != " " ? counter += 1 : nil
end
  return counter
end

def current_player
  turn_count.even? ? "X" : "O"
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    turn = current_player(board)
    move(board, index, turn)
  else
    puts "Please try again"
    turn(board)
  end
    display_board(board)
end

end
