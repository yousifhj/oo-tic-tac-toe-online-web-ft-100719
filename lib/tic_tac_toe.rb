class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end 
  
  WIN_COMBINATIONS= 
    [[0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]

  def display_board 
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end
   
   def input_to_index(input)
     return index = input.to_i - 1 
   end 
   
   def move(index, current_player = "X")
     @board[index] = current_player
   end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end 
  
  def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
  end
  
  def turn
    puts "Please choose a number 1-9:"
    user_input = gets.chomp
   { index = input_to_index(user_input)
      if valid_move?(index)
        player_token = current_player
        move(index, player_token)
        display_board
      else
        turn
      end
    end}
       
  def turn_count
      turn = 0
      @board.each do |index|
        if index == "X" || index == "O"
          turn += 1
        end
      end
      return turn
    end
    
end 
