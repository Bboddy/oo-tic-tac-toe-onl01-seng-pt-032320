class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  
  [0,3,6], # Left row
  [1,4,7], # Middle row
  [2,5,8], # Right row
  
  [0,4,8], # Right diag row
  [6,4,2], # Left diag row
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    return input.to_i - 1
  end
  
  def move(index, playerToken = "X")
    @board[index] = playerToken
  end
  
  def position_taken?(index)
    @board[index] != " "
  end
  
  def valid_move?(position)
    position.between?(0, 8) && !position_taken?(position)
  end
  
  def turn_count
    @board.count{|indexs| indexs != " "}
  end
  
  def current_player
    turn_count.even? ? "X" : "O"
  end
  
  def turn 
    input = gets.strip
    input = input_to_index(input)
    if valid_move?(input)
      token = current_player
      move(input, token)
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.any? { |indexs|
      if position_taken?(indexs[0]) && @board[indexs[0]] == @board[indexs[1]] && @board[indexs[1]] == @board[indexs[2]]
        return indexs.to_ary
      end
    }
  end
  
  def full?
    if @board.any?{ |indexs| indexs == " "}
      return false
    else
      return true 
    end
  end
  
  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    if winner = won?
      @board[combo[0]]
    end
  end
  
  def play 
    turn while !over?
      if won?
        puts "Congratulations #{winner?}!"
      else
        puts "Draw"
      end
  end
end