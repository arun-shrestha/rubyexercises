class Customer

    def initialize(customer_details)
        @cust = customer_details
    end

    def print_customer_details()
        puts "Customer details:"
        puts "Name: #{@cust['name']}"
        puts "Starsign: #{@cust['starsign']}"
        puts "Age: #{@cust['age']}"
        puts "=" * 15
    end

    def update_customer_name(new_name)
        @cust['name'] = new_name
    end

end



# ask user if they want to update customer
# if user says yes
    # ask for the new name
# update name of customer
# print details of customer

# @customer['name'] = new_name

pedro = Customer.new({ "name" => "Pedro", "starsign" => "Taurus", "age" => 21 })


jake = Customer.new(
    { "name" => "Jake", "starsign" => "Aries", "age" => 23 }
    )

puts "Welcome to customer central"
puts "Here are the current customers:"

customers = [pedro, jake]
customers.each do |customer|
    customer.print_customer_details()
end

puts "\n\n"
puts "Would you like to change a customer name? Y/N"
print "> "
answer = gets.chomp

if answer == "Y"
    puts "Which customer would you like to update? Pedro (1) or Jake (2)"
    print "> "
    which_customer = gets.chomp.to_i
    puts "What is the new name?"
    print "> "
    new_name = gets.chomp
    customers[which_customer - 1].update_customer_name(new_name)
    puts "Customer updated!"
    puts customers[which_customer - 1].print_customer_details()
end