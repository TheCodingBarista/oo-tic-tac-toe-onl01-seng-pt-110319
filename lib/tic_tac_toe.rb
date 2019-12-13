class TicTacToe
  
  def initialize()
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i-1
  end
  
  def move(index, player_token = "X")
    @board[index] = player_token
  end
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
    @board[index] != " "
  end
  
  def valid_move?(index)
    index.between?(0, 9) && !position_taken?(index)
  end
  
  def turn_count
    @board.count{ |x| x != " " }
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    index = input_to_index(gets.chomp)
    
    if valid_move?(index)
        move(index, current_player)
        display_board
    else
        turn
    end
  end
  
  def won?
    x = WIN_COMBINATIONS.find {|win|
      @board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] == "X"}
    o = WIN_COMBINATIONS.find {|win|
      @board[win[0]] == "O" && @board[win[1]] == "O" && @board[win[2]] == "O"}
    return x || o
  end
  
  def full?
    @board.all? { |space| space != " "}
  end
  
  def draw?
    !won? && full?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    else
      nil
    end
  end
  
  def play
    turn until over?
    
    if won? ? puts("Congratulations #{winner}!") : puts("Cat's Game!")
    end
  end  
end