positions = { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }
play_again = " "
number_of_times_played = 0
number_of_wins = 0

def draw_game_grid(positions)
  system 'clear'
  puts "     |     |     "
  puts "  #{positions[1]}  |  #{positions[2]}  |  #{positions[3]  }"
  puts "     |     |     "    
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{positions[4]}  |  #{positions[5]}  |  #{positions[6]  }"
  puts "     |     |     "    
  puts "-----+-----+-----"
  puts "     |     |     "  
  puts "  #{positions[7]}  |  #{positions[8]}  |  #{positions[9]  }"
  puts "     |     |     "
end

def available_positions(positions)
  positions.select {|k, v| v == " "}.keys
end

def get_player_square(positions)
  puts "Choose an available position (from 1 to 9) to claim that spot."
  user_choice = gets.chomp.to_i
    until available_positions(positions).include?(user_choice)
      puts "Not a valid choice, try again"
      user_choice = gets.chomp.to_i
    end
  positions[user_choice] = 'X'
end

def get_computer_square(positions)
  sleep(0.5)
  #Computer will block if player has 2 in a row or win if it has the chance
  if (positions[1] == "X" && positions[2] == "X" && positions[3] == " ") || (positions[1] == "O" && positions[2] == "O" && positions[3] == " ")
    positions[3] = "O"
  elsif (positions[1] == "X" && positions[2] == " " && positions[3] == "X") || (positions[1] == "O" && positions[2] == " " && positions[3] == "O")
    positions[2] = "O"
  elsif (positions[1] == " " && positions[2] == "X" && positions[3] == "X") || (positions[1] == " " && positions[2] == "O" && positions[3] == "O")
    positions[1] = "O"
  elsif (positions[4] == "X" && positions[5] == "X" && positions[6] == " ") || (positions[4] == "O" && positions[5] == "O" && positions[6] == " ")
    positions[6] = "O"
  elsif (positions[4] == "X" && positions[5] == " " && positions[6] == "X") || (positions[4] == "O" && positions[5] == " " && positions[6] == "O")
    positions[5] = "O"
  elsif (positions[4] == " " && positions[5] == "X" && positions[6] == "X") || (positions[4] == " " && positions[5] == "O" && positions[6] == "O")
    positions[4] = "O"
  elsif (positions[7] == "X" && positions[8] == "X" && positions[9] == " ") || (positions[7] == "O" && positions[8] == "O" && positions[9] == " ")
    positions[9] = "O"
  elsif (positions[7] == "X" && positions[8] == " " && positions[9] == "X") || (positions[7] == "O" && positions[8] == " " && positions[9] == "O")
    positions[8] = "O"
  elsif (positions[7] == " " && positions[8] == "X" && positions[9] == "X") || (positions[7] == " " && positions[8] == "O" && positions[9] == "O")
    positions[7] = "O"
  elsif (positions[1] == "X" && positions[4] == "X" && positions[7] == " ") || (positions[1] == "O" && positions[4] == "O" && positions[7] == " ")
    positions[7] = "O"
  elsif (positions[1] == "X" && positions[4] == " " && positions[7] == "X") || (positions[1] == "O" && positions[4] == " " && positions[7] == "O")
    positions[4] = "O"
  elsif (positions[1] == " " && positions[4] == "X" && positions[7] == "X") || (positions[1] == " " && positions[4] == "O" && positions[7] == "O")
    positions[1] = "O"
  elsif (positions[2] == "X" && positions[5] == "X" && positions[8] == " ") || (positions[2] == "O" && positions[5] == "O" && positions[8] == " ")
    positions[8] = "O"
  elsif (positions[2] == "X" && positions[5] == " " && positions[8] == "X") || (positions[2] == "O" && positions[5] == " " && positions[8] == "O")
    positions[5] = "O"
  elsif (positions[2] == " " && positions[5] == "X" && positions[8] == "X") || (positions[2] == " " && positions[5] == "O" && positions[8] == "O")
    positions[2] = "O"
  elsif (positions[3] == "X" && positions[6] == "X" && positions[9] == " ") || (positions[3] == "O" && positions[6] == "O" && positions[9] == " ")
    positions[9] = "O"
  elsif (positions[3] == "X" && positions[6] == " " && positions[9] == "X") || (positions[3] == "O" && positions[6] == " " && positions[9] == "O")
    positions[6] = "O"
  elsif (positions[3] == " " && positions[6] == "X" && positions[9] == "X") || (positions[3] == " " && positions[6] == "O" && positions[9] == "O")
    positions[3] = "O"
  elsif (positions[1] == "X" && positions[5] == "X" && positions[9] == " ") || (positions[1] == "O" && positions[5] == "O" && positions[9] == " ")
    positions[9] = "O"
  elsif (positions[1] == "X" && positions[5] == " " && positions[9] == "X") || (positions[1] == "O" && positions[5] == " " && positions[9] == "O")
    positions[5] = "O"
  elsif (positions[1] == " " && positions[5] == "X" && positions[9] == "X") || (positions[1] == " " && positions[5] == "O" && positions[9] == "O")
    positions[1] = "O"
  elsif (positions[7] == "X" && positions[5] == "X" && positions[3] == " ") || (positions[7] == "O" && positions[5] == "O" && positions[3] == " ")
    positions[3] = "O"
  elsif (positions[7] == "X" && positions[5] == " " && positions[3] == "X") || (positions[7] == "O" && positions[5] == " " && positions[3] == "O")
    positions[5] = "O"
  elsif (positions[7] == " " && positions[5] == "X" && positions[3] == "X") || (positions[7] == " " && positions[5] == "O" && positions[3] == "O")
    positions[7] = "O"                                                 
  else
    position = available_positions(positions).sample
    positions[position] = "O"
  end
end

def check_for_winner(positions)
  if (positions[1] == "X" && positions[2] == "X" && positions[3] == "X") || 
    (positions[4] == "X" && positions[5] == "X" && positions[6] == "X") ||
    (positions[7] == "X" && positions[8] == "X" && positions[9] == "X") ||
    (positions[1] == "X" && positions[4] == "X" && positions[7] == "X") ||
    (positions[2] == "X" && positions[5] == "X" && positions[8] == "X") ||
    (positions[3] == "X" && positions[6] == "X" && positions[9] == "X") ||
    (positions[1] == "X" && positions[5] == "X" && positions[9] == "X") ||
    (positions[7] == "X" && positions[5] == "X" && positions[3] == "X") 
    winner = "You win!"
  elsif (positions[1] == "O" && positions[2] == "O" && positions[3] == "O") || 
    (positions[4] == "O" && positions[5] == "O" && positions[6] == "O") ||
    (positions[7] == "O" && positions[8] == "O" && positions[9] == "O") ||
    (positions[1] == "O" && positions[4] == "O" && positions[7] == "O") ||
    (positions[2] == "O" && positions[5] == "O" && positions[8] == "O") ||
    (positions[3] == "O" && positions[6] == "O" && positions[9] == "O") ||
    (positions[1] == "O" && positions[5] == "O" && positions[9] == "O") ||
    (positions[7] == "O" && positions[5] == "O" && positions[3] == "O") 
    winner = "You lose!"
  else
    false
  end
end

while play_again != "N"
  begin
    draw_game_grid(positions)
    get_player_square(positions)
    draw_game_grid(positions)
    winner = check_for_winner(positions)
    get_computer_square(positions)
    draw_game_grid(positions)
    winner = check_for_winner(positions)
  end until winner || available_positions(positions).empty?
  if winner == false
    puts "It's a tie..."
    number_of_times_played += 1
    number_of_wins = number_of_wins
  else  
    puts winner
    if winner == "You win!"
      number_of_times_played += 1
      number_of_wins += 1
    else
      number_of_times_played += 1
      number_of_wins = number_of_wins 
    end  
  end
  puts "You are #{number_of_wins} for #{number_of_times_played}."
  puts "Do you want to play again (Y/N)?"
  play_again = gets.chomp.capitalize
  positions = { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }
end
