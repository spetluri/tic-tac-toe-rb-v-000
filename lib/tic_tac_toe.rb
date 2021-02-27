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


def display_board(board)
  
  puts(" #{board[0]} | #{board[1]} | #{board[2]} ")
  puts("-----------")
  puts(" #{board[3]} | #{board[4]} | #{board[5]} ")
  puts("-----------")
  puts(" #{board[6]} | #{board[7]} | #{board[8]} ")
  
end

def input_to_index(input)
  input = input.to_i
  input == 0 ? -1 : input - 1
end

def move(board,index,player_token)
  board[index] = player_token
end

def position_taken?(board,index)
  if board[index] == "" || board[index] == " " || board[index] == nil
    false
  else
    true
  end
  
end

def valid_move?(board, position)

  if position.between?(0,8) && position_taken?(board,position) == false
    true
  else
    false
  end
  
end


ef won?(board)
  
  WIN_COMBINATIONS.each do |win_combo|
    
    all_x = win_combo.all? do |win_index|
      
      board[win_index] == "X"
      
    end
    
    all_y = win_combo.all? do |win_index|
      
      board[win_index] == "O"
      
    end
    
    if all_x || all_y
      
      return win_combo
      
    end
    
  end
  
  return false
  
end

def full?(board)
  
  if board.any?{|i| i == " "}
    return false
  end
  
  return true
  
end

def winner(board)
  
  winner = won?(board)
  if winner.class == Array
    return board[winner[0]]
  end
  
  return nil

end

def draw?(board)
  
  if !won?(board) && full?(board)
    return true
  end
  return false
  
end

def over?(board)
  
  if draw?(board) || won?(board)
    return true
  end
  
    return false
    
end