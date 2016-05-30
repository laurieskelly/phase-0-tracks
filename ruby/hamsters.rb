puts "What is the hamster's name?"
name = gets.chomp

puts "How noisy is the hamster? (1 to 10)"
volume = gets.chomp.to_i

puts "What color is the hamster's fur?"
fur_color = gets.chomp

puts "Is the hamster a good candidate for adoption? (y/n)"
is_adoptable = gets.chomp

if is_adoptable == "y"
	is_adoptable = true
elsif is_adoptable == "n"
	is_adoptable = false
else
	is_adoptable = nil
end

puts "What is the estimated age of the hamster? (in years)"
age = gets.chomp

if age == ""
	age = nil
else
	age = age.to_f
end

puts "\n\nHere is your hamster data: "
puts "Hamster name: #{name}"
puts "Noise level: #{volume}"
puts "Fur color: #{fur_color}"
puts "Adoptable?: #{is_adoptable}"
puts "Age: #{age} years"