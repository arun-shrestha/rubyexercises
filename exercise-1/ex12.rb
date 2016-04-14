class Customer
	def initialize(customer_details)
		@customer = customer_details
	end

	def print_customer_details()
		puts "Customer details:"
		puts "Name: #{@customer['name']}"
		puts "Starsign: #{@customer['starsign']}"
		puts "Age: #{@customer['age']}"
		puts "=" * 15
	end

	def update_customer_name(new_name)
		@customer['name'] = new_name

		
	end
end


pedro = Customer.new({"name" => "Pedro", "starsign" => "Taurus", "age" => 21})


arun = Customer.new({"name" => "Arun", "starsign" => "Taurus", "age" => 28})

puts "Welcome to customer central"
puts "Here are the current customers: "

customers = [pedro, arun]
customers.each do |customer|
	customer.print_customer_details()
end

puts "\n\n"

puts "Would you like to change customer name press 'Y' for yes and 'N' for no"
print "> "
update = gets.chomp
if (update == 'Y' || update == 'y')
	puts "Please press 1 or 2 regarding your choice"
	print "> "
	customer_number = gets.chomp.to_i
	puts "What is new name?"
	print "> "
	new_name = gets.chomp
	customers[customer_number - 1].update_customer_name(new_name)
	puts "New name updated: "
	puts customers[customer_number -1].print_customer_details
end







