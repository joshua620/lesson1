def say(x)
  puts "~ ~ ~ ~  #{x}  ~ ~ ~ ~"
end

def validate(number)
  number =~  /^[-+]?((\d+(\.\d*)?)|(\.\d+))$/
end

def validate_operation?(operation, second_number)
  if operation == "/" && second_number == "0"
    false    
  elsif operation == "+"
    true
  elsif operation == "-"
    true
  elsif operation == "*"
    true
  elsif operation == "/"
    true
  else
    false 
  end
end

def do_math(first_number, second_number, operation)
  if operation == "+"
    result = first_number.to_f + second_number.to_f
  elsif operation == "-"
    result = first_number.to_f - second_number.to_f
  elsif operation == "*"
    result = first_number.to_f * second_number.to_f
  else
    result = first_number.to_f / second_number.to_f
  end
end

def round(number)
  if number == number.to_i
    number = "%g" % ("%.2f" % number) 
  else
    number = number
  end
end

begin
  say("Enter 1st number")
  first_number = gets.chomp
    until validate(first_number)
      say("Not a valid number, try again")
      first_number = gets.chomp
    end

  say("Enter 2nd number")
  second_number = gets.chomp
    until validate(second_number)
      say("Not a valid number, try again")
      second_number = gets.chomp
    end

  say("Enter your desired operation")
    if second_number == "0"
      puts "~ ~ ~ ~           +, -, *              ~ ~ ~ ~"
    else  
      puts "~ ~ ~ ~         +, -, *, /             ~ ~ ~ ~"
    end

  operation = gets.chomp
    until validate_operation?(operation, second_number)
      say("Not a valid operation, try again")
      operation = gets.chomp
    end

  result = do_math(first_number, second_number, operation)
  say("Your result is #{round(result)}")
  puts ""
  say("Press any key for another calculation, or type quit to exit")
  go_again = gets.chomp.capitalize
end while go_again != "Quit"