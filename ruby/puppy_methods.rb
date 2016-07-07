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
		speak(1)
		while counter < seconds
			sleep 1
			counter += 1
			puts counter
		end
		speak(1)
		sleep 1
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
pup.stay(5)

class Student

	def initialize
		puts "Initializing a new student..."
	end

	def complain_about_depth
		puts "I really wish we had gone into some of the topics deeper"
	end

	def complain_about_fast
		puts "The pace of the class was crazy fast"
	end

	def complain_about_slow
		puts "The pace of the class was embarrassingly slow for what was advertised as a rigorous curriculum"
	end

	def get_job
		puts "The class was the best experience of my life and my instructors were amazing"
	end

end

1.upto(50)  do |i|
	puts "\nNew student \##{i}"
	stud = Student.new
	puts stud
	puts 
	stud.complain_about_depth
	stud.complain_about_fast
	stud.complain_about_slow
	stud.get_job
end

