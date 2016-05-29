
def ask_age()

	puts "\nHow old are you?"
	age = Integer(gets.chomp)

	puts "\nAlso, what year were you born?"
	year_born = Integer(gets.chomp)

	return [age, year_born]
end


def check_age()

	age, year_born = ask_age()

	current_year = Time.new.year
	diff = current_year - (age + year_born)

	# they could be off by 1 if birthday is later this year
	# returns true if diff is 0 or 1
	result = [0,1].include? diff

	return result
end


def ask_name()

	puts "\nWhat is your name?"
	name = gets.chomp

	puts "Thank you, " + name 

	return name
end


def get_truefalse_answer(question)

	validated_answer = nil
	while validated_answer == nil

		puts question + " (y/n)"
		ans = gets.chomp

		if ans.eql? "y"
			validated_answer = true
		
		elsif ans == "n"
			validated_answer = false
		
		else
			puts "Oops, please respond only with 'y' or 'n'.\n"
		
		end
	end
	return validated_answer
end


def test_responses(responses)

	name, age, bread, ins = responses

	if age && bread || ins 
		return "#{name} is probably not a vampire."

	elsif !age && (!bread || !ins)
		return "#{name} is probably a vampire"

	elsif !age && !bread && !ins
		return "#{name} is almost certainlly a vampire"

	elsif ["Dr. Acula", "Tu Fang", "Drake Cula"].include? name
		return "Come on, #{name}, you are definitely a vampire."

	else 
		return "Results for #{name}: inconclusive"
	end
end


#### ASK QUESTIONS ####

def conduct_survey()

	puts "Hello. Please provide truthful responses to the following questions. \n"

	name = ask_name()

	age_consistent = check_age()

	garlic_question = "\nOur company cafeteria serves garlic bread. Should we order some for you?"
	wants_garlic_bread = get_truefalse_answer(garlic_question)

	insurance_question = "\nWould you like to enroll in the company’s health insurance?"
	wants_insurance = get_truefalse_answer(insurance_question)

	responses = [name, age_consistent, wants_garlic_bread, wants_insurance]

	return responses

end


def report_results(responses)
	
	vampire_results = test_responses(responses)
	puts "Calculating results... \n...\n"
	return vampire_results
end


def how_many()
	puts "How many surveys will you be conducting today?"
	return Integer(gets.chomp)
end


def print_results()
	quest = "Should survey results be printed on-screen?"
	return get_truefalse_answer(quest)
end


def conduct_multiple_surveys()

	puts "Welcome to Vampire Survey LLC. \n"

	num_surveys = how_many()
	print_onscreen = print_results()

	group_vampire_results = []
	
	num_surveys.times  do

		puts "\n\n\nReady for next survey-taker. "
		puts "When ready, please press <enter> to continue"
		gets
		puts "\n\n\n\n\n"

		responses = conduct_survey()

		puts "\n\n\n\n\n"

		vampire_results = report_results(responses)

		if print_onscreen
			puts vampire_results
		end

		puts "\n\nEnd of survey. Thank you very much for your cooperation."
		
		group_vampire_results.push([responses,vampire_results])
	
	end

	puts "\n\n\n\n\n"
	quest = "#{num_surveys} surveys completed successfully. Print results?"
	print_now = get_truefalse_answer(quest)

	if print_now
		puts group_vampire_results
	end

	return group_vampire_results

end

conduct_multiple_surveys