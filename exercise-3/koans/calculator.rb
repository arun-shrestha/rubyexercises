
# This method takes each number the user wants to calculate, 
# and runs the block for each value, outputting each returned value from the block
def get_values(n)
   1.upto(n).map { |n|
    print "Enter value ##{ n }: "
    gets.chomp.to_f
  }
end

# This method displays greetings and gives user options of calculation. 
def greetings
	puts "\n\n"
	puts "-" * 20
	puts "Welcome to RubyCalc"
	puts "-" * 20
	puts "Would you like to 
    0 ---- [exit],  
    1 ---- [add], 
    2 ---- [subtract], 
    3 ---- [multiply], 
    4 ---- [divide]"
    puts "-" * 20

end

# This loop gets option in numeric value from user
# and ask user to input how many values he/she wants to calculate
# get_value method is called and it asks user to input each value.
# It also select the calculating operator according to user option.
# The loop continous until user wants to exit.

while true
	greetings
	option = gets.chomp.to_i


	case option
	when 0
		exit

	when 1
	  puts "How many numbers would you like to Add? "
	  num_of_values = gets.to_i
	  operator = :+

	when 2
	  puts "How many numbers would you like to subtract?"
	  num_of_values = gets.to_i
	  operator = :-

	when 3
	  puts "How many numbers would you like to multiply?"
	  num_of_values = gets.to_i
	  operator = :*

	when 4
	  puts "How many numbers would you like to divide?"
	  num_of_values = gets.to_i
	  operator = :/
	end

	answer = get_values(num_of_values).inject(operator)
	puts "The answer is: #{ answer }"

	# Answer gets all the values entered from user and injects calculating
	# operator (+, -, *, /) in between each values.
	# The result is calculated in 'puts'.
end
# Loop ends here.

