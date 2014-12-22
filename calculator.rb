def say(x)
  puts "~ ~ ~ ~  #{x}  ~ ~ ~ ~"
end

def validate(num)
  num =~  /^[-+]?((\d+(\.\d*)?)|(\.\d+))$/
end

def validate_operation?(operation, second_num)
  if operation == "/" && second_num == "0"
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

def do_math(first_num, second_num, operation)
  if operation == "+"
    result = first_num.to_f + second_num.to_f
  elsif operation == "-"
    result = first_num.to_f - second_num.to_f
  elsif operation == "*"
    result = first_num.to_f * second_num.to_f
  else
    result = first_num.to_f / second_num.to_f
  end
end

def round(num)
  if num == num.to_i
    num = "%g" % ("%.2f" % num) 
  else
    num = num
  end
end

begin
  say("Enter 1st number")
  first_num = gets.chomp
    until validate(first_num)
      say("Not a valid number, try again")
      first_num = gets.chomp
    end

  say("Enter 2nd number")
  second_num = gets.chomp
    until validate(second_num)
      say("Not a valid number, try again")
      second_num = gets.chomp
    end

  say("Enter your desired operation")
    if second_num == "0"
      puts "~ ~ ~ ~           +, -, *              ~ ~ ~ ~"
    else  
      puts "~ ~ ~ ~         +, -, *, /             ~ ~ ~ ~"
    end

  operation = gets.chomp
    until validate_operation?(operation, second_num)
      say("Not a valid operation, try again")
      operation = gets.chomp
    end

  result = do_math(first_num, second_num, operation)
  say("Your result is #{round(result)}")
  puts ""
  say("Press any key for another calculation, or type quit to exit")
  go_again = gets.chomp.capitalize
end while go_again != "Quit"