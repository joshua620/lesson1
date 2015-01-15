player_cards = []
dealer_cards = []
play_again = ' '
player_money = 100
hit_or_stay = ' '
player_bet = 0

def validate_player_bet(player_bet, player_money)
  if player_bet > 0 && player_bet <= player_money
    true
  else
    false
  end
end

def check_for_ace(cards, total)
  number_of_aces = 0
  cards.each do |card| 
    if card == 'A '
      number_of_aces += 1
    end
  end
  if number_of_aces == 4
    total -= 40
  elsif number_of_aces == 3
    total -= 30
  elsif (total > 21 && total < 32) && number_of_aces == 2
    total -= 10
  elsif total > 21 && number_of_aces == 2
    total -= 20  
  elsif total > 21 && number_of_aces == 1
    total -= 10      
  else
    total
  end  
end  

def calculate_player_money(player_bet, player_money, result)
  if result == 'You win.'
    player_money + player_bet
  elsif result == 'Blackjack, you win.'
    (player_money + (1.5 * player_bet)).to_i
  elsif result == 'Push.'
    player_money
  elsif result == 'You have Blackjack and the Dealer has blackjack. Push.'
    player_money        
  else
    player_money - player_bet
  end  
end  

def modify_card_value(card)
  if card == 'J ' || card == 'Q ' || card == 'K '
    return 10
  elsif card == 'A '
    return 11
  else
    return card.to_i          
  end
end  

def calculate_result(player_total, dealer_total, player_cards, dealer_cards)
  if player_total > 21
    "You loose."
  elsif (player_total == 21 && player_cards.count == 2) && (dealer_total != 21 || dealer_cards.count > 2)
    "Blackjack, you win."
  elsif (player_total == 21 && player_cards.count == 2) && (dealer_total == 21 && dealer_cards.count == 2)
    "You have Blackjack and the Dealer has blackjack. Push."   
  elsif dealer_total > 21
    "You win."
  elsif dealer_total == 21 && dealer_cards.count == 2
    "Dealer has Blackjack, you loose."    
  elsif player_total > dealer_total
    "You win."
  elsif player_total == dealer_total
    "Push."
  else
    "You loose."    
  end  
end

system 'clear'
puts "Wecome to Ford's Casino!"
sleep(1)
puts "Changing one hundred!" 
puts "Please enter your name: "
player_name = gets.chomp

begin

  deck = { 
    1 => '2 ', 2 => '2 ', 3 => '2 ', 4 => '2 ',
    5 => '3 ', 6 => '3 ', 7 => '3 ', 8 => '3 ',  
    9 => '4 ', 10 => '4 ', 11 => '4 ', 12 => '4 ', 
    13 => '5 ', 14 => '5 ', 15 => '5 ', 16 => '5 ',
    17 => '6 ', 18 => '6 ', 19 => '6 ', 20 => '6 ',
    21 => '7 ', 22 => '7 ', 23 => '7 ', 24 => '7 ',
    25 => '8 ', 26 => '8 ', 27 => '8 ', 28 => '8 ',
    29 => '9 ', 30 => '9 ', 31 => '9 ', 32 => '9 ',
    33 => '10', 34 => '10', 35 => '10', 36 => '10',
    37 => 'J ', 38 => 'J ', 39 => 'J ', 40 => 'J ',
    41 => 'Q ', 42 => 'Q ', 43 => 'Q ', 44 => 'Q ',
    45 => 'K ', 46 => 'K ', 47 => 'K ', 48 => 'K ',
    49 => 'A ', 50 => 'A ', 51 => 'A ', 52 => 'A '
  }

  until validate_player_bet(player_bet, player_money)
    puts "#{player_name}, please place your bet. You have $#{player_money}."
    player_bet = gets.chomp.to_i  
  end

  player_cards.push(deck.delete(deck.keys.sample))
  player_cards.push(deck.delete(deck.keys.sample))
  puts "           YOUR CARDS:
   ___________     ___________ 
  |           |   |           |
  |           |   |           |
  |           |   |           |
  |     #{player_cards[0]}    |   |     #{player_cards[1]}    |
  |           |   |           |
  |           |   |           |
  |           |   |           |
  |           |   |           |
  |___________|   |___________| 

  "
  player_total = player_cards.map { |card| modify_card_value(card) }.inject(:+)
  player_total = check_for_ace(player_cards, player_total)
  puts " "

  dealer_cards.push(deck.delete(deck.keys.sample))
  dealer_cards.push(deck.delete(deck.keys.sample))
  sleep(1.5)
  puts "          DEALER CARDS:
   ___________     ___________ 
  |           |   |           |
  |           |   |           |
  |           |   |           |
  |           |   |     #{dealer_cards[1]}    |
  |           |   |           |
  |           |   |           |
  |           |   |           |
  |           |   |           |
  |___________|   |___________| 

  "

  while hit_or_stay != "S"
    puts "#{player_name}, enter 'H' for a hit, or 'S' to stay."
    hit_or_stay = gets.chomp.capitalize 
    if hit_or_stay == "H"
      sleep(1)  
      player_cards.push(deck.delete(deck.keys.sample))
      puts "
       ___________
      |           |
      |           |
      |           |
      |     #{player_cards.last}    |
      |           |
      |           |
      |           |
      |           |
      |___________|

      "
      player_total = player_cards.map { |card| modify_card_value(card) }.inject(:+)
      player_total = check_for_ace(player_cards, player_total)
      puts "Your total is #{player_total}."
      if player_total > 21
        puts "You bust."
        break
      end
    end
  end

  puts " "
  player_total = player_cards.map { |card| modify_card_value(card) }.inject(:+)
  player_total = check_for_ace(player_cards, player_total)
  dealer_total = dealer_cards.map { |card| modify_card_value(card) }.inject(:+)
  dealer_total = check_for_ace(dealer_cards, dealer_total)

  if player_total < 22
    while dealer_total < 16
      sleep(1)  
      dealer_cards.push(deck.delete(deck.keys.sample))
      puts "       Dealer hits:"
      puts "
       ___________
      |           |
      |           |
      |           |
      |     #{dealer_cards.last}    |
      |           |
      |           |
      |           |
      |           |
      |___________|

      "
      dealer_total = dealer_cards.map { |card| modify_card_value(card) }.inject(:+)
      dealer_total = check_for_ace(dealer_cards, dealer_total)
    end  
  end

  sleep(1.5)
  puts "You have #{player_total} and the dealer has #{dealer_total}."
  result = calculate_result(player_total, dealer_total, player_cards, dealer_cards)
  puts result
  player_money = calculate_player_money(player_bet, player_money, result)
  puts "You have $#{player_money}."

  if player_money == 0
    puts "Better luck next time."
    break
  end
  
  puts "Do you want to play again (Y/N)?"
  play_again = gets.chomp.capitalize
  player_cards = []
  hit_or_stay = ' '
  dealer_cards = []
  player_bet = 0
  system 'clear'
end until play_again != "Y"
