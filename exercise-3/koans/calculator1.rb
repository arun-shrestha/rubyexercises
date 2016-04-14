


def add (a,b)
  	a + b
end

def subtract(a,b)
	get_number
  	result = a - b
end

def multiply(a,b)
	get_number
  	result = a * b
end

def divide(a,b)
	get_number
  	result = a/b
end

puts "please enter first number: "
a = gets.chomp.to_i

puts "please enter second number: "
b = gets.chomp.to_i

puts add()

# puts "Welcome to RubyCalc"
# puts "Would you like to 
    # 0 ---- [exit],  
    # 1 ---- [add], 
    # 2 ---- [subtract], 
    # 3 ---- [multiply], 
    # 4 ---- [divide]"

# option = gets.chomp.to_s

# puts "Please put first number: "
# a = gets.chomp.to_i

# puts "Please put second number: "
# b = gets.chomp.to_i


# case 
# when 1
# 	get_number
# 	add

# when 2
# 	subtract
# when option == '3'
# 	multiply
# when option == '4'
# 	divide
# when option == '0'
# 	quit 
# end

# def get_number
# 	print "Enter first number: "
# 	a = gets.chomp.to_i
# 	print "Enter second number: "
# 	b = gets.chomp.to_i
# end

# puts "The result is: #{result}"

