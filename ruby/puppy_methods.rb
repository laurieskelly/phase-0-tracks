class Puppy

	def initialize
		puts "Initializing new puppy instance ..."
	end
	
	def fetch(toy)
		puts "I brought back the #{toy}!"
		toy
	end

	def speak(numwoofs)
		x = numwoofs
		x.times {print "Woof! "}
		puts
		x
	end

	def roll_over
		puts "*rolls over*"
	end

	def dog_years(human_years)
		x = human_years
		puts x * 7
		x * 7
	end

	def stay(seconds)
		counter = 0
		while counter < seconds
			speak(1)
			sleep 1
			counter += 1
			puts counter
		end
		speak(1)
	end
end

puts "\nnew puppy"
pup = Puppy.new
puts pup
puts "\nfetch ball"
pup.fetch("ball")
puts "\nspeak 3 times"
pup.speak(3)
puts "\nroll over"
pup.roll_over
puts "\n3 in human years is how many dog years"
pup.dog_years(3)
puts "\nstay for 5 seconds"
p.stay(5)