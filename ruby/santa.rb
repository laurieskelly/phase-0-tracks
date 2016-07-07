class Santa
	attr_accessor :gender
	attr_reader :age, :ethnicity

	def initialize(gender, ethnicity, reindeer=nil)
		
		puts "Initializing Santa instance ..."

		default_rank = [
			"Rudolph", 
			"Dasher", 
			"Dancer", 
			"Prancer", 
			"Vixen", 
			"Comet", 
			"Cupid", 
			"Donner", 
			"Blitzen"
		]
		if not reindeer
			reindeer = default_rank
		end
		@gender = gender # a string passed in on initialization
		@ethnicity = ethnicity # a string passed in on initialization
		@reindeer_ranking = reindeer # an array of reindeer from most preferred to least 
		@age = 0 #which is not passed in on initialization and defaults to 0
	end

	def speak 
		puts "Ho, ho, ho! Haaaappy holidays!"
	end

	def eat_milk_and_cookies(cookietype)
		puts "That was a good #{cookietype}!" 
	end

	# setters
	def celebrate_birthday
		# should age Santa by one year
		@age = @age + 1
		@age
	end

	def get_mad_at(deer)
		# take a reindeer's name as an argument
		# move that reindeer in last place in the reindeer rankings		
		puts "before: #{@reindeer_ranking}"
		@reindeer_ranking.delete(deer)
		@reindeer_ranking.push(deer)
		puts "after: #{@reindeer_ranking}"
	end

	# def gender(new_value)
	# 	@gender = new_value
	# 	@gender
	# end

	# # getters
	# def age
	# 	@age
	# end

	# def ethnicity
	# 	@ethnicity
	# end

end

# # one santa (release 0, 2)
iz_sanna = Santa.new("agender", "black")
puts iz_sanna

# iz_sanna.speak
# iz_sanna.eat_milk_and_cookies('rugalach')
puts iz_sanna.ethnicity
puts iz_sanna.age
puts iz_sanna.celebrate_birthday
puts iz_sanna.celebrate_birthday
puts iz_sanna.celebrate_birthday
iz_sanna.gender = 'mindja beezwax'
puts iz_sanna.gender

iz_sanna.get_mad_at('Donner')


# # lots of santas (release 1)
# santas = []
# santas << Santa.new("agender", "black")
# santas << Santa.new("female", "Latino")
# santas << Santa.new("bigender", "white")
# santas << Santa.new("male", "Japanese")
# santas << Santa.new("female", "prefer not to say")
# santas << Santa.new("gender fluid", "Mystical Creature (unicorn)")
# santas << Santa.new("N/A", "N/A")

