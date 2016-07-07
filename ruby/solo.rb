# 0.
# Design (as opposed to actually building) a class representing anything you like. 
# your class must have:

# at least three attributes (using at least two data types) whose values will vary from instance to instance (example: age)
# at least three methods, at least one of which takes an argument


class Dress
	attr_accessor :loaned_to, :is_clean, :borrowed_by
	attr_reader :color, :season, :designer, :compliments


	def initialize(length, color, season, designer)

		@color = color
		@season = season
		@length = length
		@designer = designer
		@is_clean = true
		@loaned_to = nil
		@borrowed_by = []
		@compliments = 0

	end

	def wear
		@is_clean = false
		@is_clean 
	end

	def wash
		@is_clean = true
		@is_clean 
	end		

	def note_compliment
		@compliments += 1
		@compliments
	end

	def loan_to(friend)
		@loaned_to = friend
		@is_clean = false
	end

	def back_from_loan
		@borowed_by.push(@loaned_to)
		@loaned_to = nil
	end

	def stain_suspects
		@borrowed_by
	end

	def available_to_wear
		return (@is_clean and (not @loaned_to))
	end

	def describe
		return "#{@length} #{@color} #{@season} dress by #{@designer}".capitalize
	end
end

class Closet
	attr_accessor :dresses

	def initialize
		@dresses = []
	end

	def inventory

		@dresses.each_with_index do |d, i|
			msg  = "#{i + 1}. #{d.describe}"
			msg += "\n  - #{d.compliments} compliments"
			if d.is_clean
				msg += "\n  - clean"
			else
				msg += "\n  - dirty"
			end
			if d.loaned_to
				msg += "\n  - on loan to #{d.loaned_to}"
			end
			puts msg
		end
	end

	def do_laundry
		puts "ohhhhh mygod this is crazy i have to do laundry"
		for d in @dresses
			d.wash
		end
	end

	def available_dresses(print=false)
		options = []
		for d in @dresses
			if d.available_to_wear
				options.push(d)
				puts "#{(options.length + 2)}. #{d.describe}" if print
			end
		end
		return options
	end

	def what_should_i_wear_today(sseason=nil)
		options = available_dresses
		if sseason
			options.keep_if {|o| o.season.downcase == sseason.downcase.strip}
		end
		
		options.sort! {|o1,o2| o2.compliments - o1.compliments}

		puts "Top 3 choices to wear today:"
		for o in options[0..2]
			puts "  - #{o.describe}, #{o.compliments} compliments"
		end

		return options
	end
end



colors = ['gray', 'flowered', 'red', 'light green', 'navy', 'black', 'lavender gingham', 'black polka-dot']
seasons = ['spring', 'summer', 'fall', 'winter']
lengths = ['long', 'knee-length', 'knee-length', 'knee-length', 'tea-length', 'medium-short', 'short']
designers = ['Tar-jay', 'Betsey Ford', 'Tallulah Patata', 'Everyday Bacon', '@hipstersauce', 'Lily Kulashaka']
friends = ['Natalie', 'Shanya', 'Alex', 'Rachel', 'Diana', 'Julia']

closet = Closet.new
1.upto(30) do |i|
	
	attrs = [lengths, colors, seasons, designers].map! {|a| a.sample}
	dress = Dress.new(*attrs)

	if rand < 0.2
		dress.loan_to(friends.sample)
	end
	(0 + rand(15)).times {dress.note_compliment}
	closet.dresses.push(dress)

end

closet.inventory

# simulate life
50.times {closet.dresses.sample.borrowed_by.push(friends.sample)}
closet.available_dresses.sample((1 + rand(10))).each {|d| d.wear}

# pick a dress
puts "\n\nWhat should I wear today?"
closet.what_should_i_wear_today("summer")

