class Customer
	def initialize(customer)
		@customer = customer
	end

	def print_customer_details()
		puts "Customer details:"
		puts "Name: #{@customer['name']}"
		puts "Starsign: #{@customer['starsign']}"
		puts "Age: #{@customer['age']}"
		puts "=" * 15
	end
end

pedro = Customer.new({"name" => "Pedro", "starsign" => "Taurus", "age" => 21})

pedro.print_customer_details()

arun = Customer.new({"name" => "Arun", "starsign" => "Taurus", "age" => 28})

arun.print_customer_details()