require 'csv'

class Customer
	def initialize(customer_details)
		@customer = customer_details
	end

	def print_customer_details()
		puts "Customer details:"
		puts "Customer_id: #{@customer['id']}"
		puts "Name: #{@customer['name']}"
		puts "Address: #{@customer['address']}"
		puts "Phone No: #{@customer['phone_no']}"
		puts "Email Addrss: #{@customer['email']}"
		puts "Account Balance: #{@customer['account_balance']}"
		puts "=" * 15
	end

    def put_customer_id(new_id)
    	@customer['id'] = new_id
    end

	def put_customer_name(new_name)
        @customer['name'] = new_name
    end

    def put_customer_address(new_address)
		@customer['address'] = new_address
	end

	def put_customer_phone_no(new_phone_no)
        @customer['phone_no'] = new_phone_no
    end

    def put_customer_email(new_email)
        @customer['email'] = new_email
    end

    def put_customer_account_balance(new_account_balance)
        @customer['account_balance'] = new_account_balance
    end
  

    def get_customer_id()
        return @customer['id']
    end

    def get_customer_name()
        return @customer['name']
    end

    def get_customer_address()
        return @customer['address']
    end

    def get_customer_phone_no()
        return @customer['phone_no']
    end

    def get_customer_email()
        return @customer['email']
    end

    def get_customer_account_balance()
        return @customer['account_balance']
    end  


    def save_to_file()
    	filename = 'customers.csv'
    	customer_file = open(filename,'a')
    	customer_file.write(@customer['id'] + ',' + @customer['name'] + ',' + @customer['address'] + ',' + @customer['phone_no'] + ',' + 
    	@customer['email'] + ',' + @customer['account_balance'] )
    	customer_file.write("\n") 
    	customer_file.close
    	puts "New customer added."
    	puts "=" * 30
	end

end


# ----------------------------------------------------------------------------
# SEARCH AND DISPLAY METHODS
# ----------------------------------------------------------------------------

# Method for getting customer details and allowing user to choose a customer 
# the customers.csv file. The Method converts the line containing the string holding
# customer information in the file into a customer object that can then be manipulated
# by the other methods. It also returns a prompt if the user does not use an id that
# exists.

def get_customer
	# get existing customers
	customer_array = display_customers
	puts "Choose customer Number"
	customer_number = gets.chomp
	# find customer in customer array
	customer = []
	find = false
	customer_array.each do |row_array|
		if (row_array[0] == customer_number)
			customer = row_array
			find = true
		end
  	end
  	# If customer not found return error prompt and go back to main
  	if (!find)
  		puts "Customer not found!"
  		main
  	end
	# display the chosen customer
	puts "Chosen Customer"
	puts "Name #{customer[1]}"
	# create customer object
	chosen_customer = Customer.new({"customerID" => customer[0], "name" => customer[1], "address" => customer[2], "phone" => customer[3], "email" => customer[4], "balance" => customer[5]})
end

# ----------------------------------------------------------------------------

def delete_customer(customer)

	customer_array = CSV.read('customers.csv')

	# find which customer was edited and delete those customer details
	# in the customer_array by not rewriting them back into the file.

	CSV.open('customers.csv', 'w') do |csv_object|
  		customer_array.each do |row_array|
  			if (row_array[0] != customer.get_customer_ID)
    				csv_object << row_array
    			end
  		end
	end

end

# This method records the withdrawal information into a created 
# customer file that is recognized by the customer account number

def update_customer_file_withdrawal(customer, amount)

	filename = customer.get_customer_ID.to_s
	time = Time.now
	f = open(filename + ".txt", 'a')
	f.puts "Date Time : " + time.inspect
	f.puts "Amount Withdrawn : $#{amount}"
	f.puts "New Balance : $#{customer.get_customer_balance}"
	f.close

end

# This method records the deposit information into a created 
# customer file that is recognized by the customer account number

def update_customer_file_deposit(customer, amount)
	
	filename = customer.get_customer_ID.to_s
	time = Time.now
	f = open(filename + ".txt", 'a')
	f.puts "Date Time : " + time.inspect
	f.puts "Amount Deposited : $#{amount}"
	f.puts "New Balance : $#{customer.get_customer_balance}"
	f.close

end


def draw_line
	puts "_" * 30
	puts "\n\n"
end


def greeting_menu
	puts "\n\n"
	puts "-------------------"
	puts "Welcome to Westpac"
	puts "-------------------"
	puts "Please select from following option: "
	puts "To VIEW customers details please presss 1"
	puts "To ADD customers please presss 2"
	puts "To UPDATE customers detail please presss 3"
	puts "To WITHDREW/DEPOSIT please presss 4"
	puts "To EXIT press any key"	
end

while true

	greeting_menu

	menu_input = gets.chomp

	if menu_input == "1"


		CSV.foreach('customers.csv') do |row|
	  		puts row.inspect
	  	end
	 

	elsif menu_input == "2"

		puts "Please enter customer's ID"
		new_id = gets.chomp

		puts "Please enter customer's name"
		new_name = gets.chomp

		puts "Please enter customer's address"
		new_address = gets.chomp

		puts "Please enter customer's phone number"
		new_phone_no = gets.chomp

		puts "Please enter customer's email"
		new_email = gets.chomp
		
		puts "Please enter customer's current balance"
		new_account_balance = gets.chomp
			
		new_customer = Customer.new({"id" => new_id, "name" => new_name, 
			"address" => new_address, "phone_no" => new_phone_no, "email" => new_email, 
			"account_balance" => new_account_balance})
		new_customer.print_customer_details
		new_customer.save_to_file

	

	elsif menu_input == "3"
		break
	end

	
end





