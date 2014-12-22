require 'io/console'

def validate_input?(input)
  input == "R" || input == "P" || input == "S"
end

def alter_input(user_choice)
  if user_choice == "R"
    user_choice = "Rock"
  elsif user_choice == "P"
    user_choice = "Paper"
  else 
    user_choice = "Scissors"                        
  end
end

def generate_comp_choice
  comp_choice = Random.rand(1...4)
  if comp_choice == 1
    comp_choice = "Rock"
  elsif comp_choice == 2
    comp_choice = "Paper"
  else
    comp_choice = "Scissors"
  end
end

def print_result(user_choice, comp_choice)
  puts "You picked #{user_choice}, and the computer picked #{comp_choice}:"
end

def determine_result(user_choice, comp_choice, number_of_wins)
  if user_choice == comp_choice
    puts "Draw"
    number_of_wins = number_of_wins
  elsif user_choice == "Rock" && comp_choice == "Paper"
    puts "Paper covers Rock, you lose :("
    number_of_wins = number_of_wins  
  elsif user_choice == "Rock" && comp_choice == "Scissors"
    puts "Rock destroys Scissors, you win :)"
    number_of_wins += 1
  elsif user_choice == "Paper" && comp_choice == "Rock"
    puts "Paper covers Rock, you win :)"
    number_of_wins += 1
  elsif user_choice == "Paper" && comp_choice == "Scissors"  
    puts "Scissors slice Paper, you loose :("
    number_of_wins = number_of_wins  
  elsif user_choice == "Scissors" && comp_choice == "Rock"
    puts "Rock smashes Scissors, you loose :("
    number_of_wins = number_of_wins
  else
    puts "Scissors cut paper, you win :)"
    number_of_wins += 1         
  end      
end

number_of_wins = 0
times_played = 0

puts "Welcome what is your name?"
user_name = gets.chomp
puts ""
puts "Welcome #{user_name} to the test of skill that is"
puts "!!! ~ Rock ~ Paper ~ Scissors ~ !!!"
puts "Choose R P or S if you dare!"

begin
  user_choice = STDIN.noecho(&:gets).chomp.capitalize
  if user_choice == "Quit"
    break
  end

  validate_input?(user_choice)
    until validate_input?(user_choice)
      puts("Not a valid choice, try again")
      user_choice = STDIN.noecho(&:gets).chomp.capitalize
    end

  user_choice = alter_input(user_choice)
  comp_choice = generate_comp_choice
  puts "Rock, Paper, Scissors, SHOOT!"
  puts ""
  sleep(2)
  print_result(user_choice, comp_choice)
  number_of_wins = determine_result(user_choice, comp_choice, number_of_wins)
  times_played += 1
  puts ""
  puts "#{user_name}, you are #{number_of_wins} for #{times_played}."
  puts ""
  puts "Choose R P or S to play again or type quit to exit"
end while user_choice != "Quit"