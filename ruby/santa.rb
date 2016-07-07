class Santa

	def initialize
		puts "Initializing Santa instance ..."
	end

	def speak 
		puts "Ho, ho, ho! Haaaappy holidays!"
	end

	def eat_milk_and_cookies(cookietype)
		puts "That was a good #{cookietype}!" 
	end

end

iz_sanna = Santa.new
puts iz_sanna

iz_sanna.speak
iz_sanna.eat_milk_and_cookies('rugalach')