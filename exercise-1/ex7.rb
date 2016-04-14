puts "You enter a room with tow doors.
	  Do you open door 1 or door 2?"

print "> "
door = gets.chomp

if door == "1"
	puts "You won $5000!"
elsif door == "2"
	puts "You stare into the endless abyss :("
else
	puts "You failed"
end