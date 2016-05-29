
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


def check_name()
	# What is your name?
	puts "\nWhat is your name?"
	name = gets.chomp

	puts "\nThank you, " + name 

	return name
end


def get_truefalse_answer(question)

	validated_answer = nil
#	valid_ans = ['y','n']

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

	name = check_name()

	age_consistent = check_age()

	garlic_question = "\nOur company cafeteria serves garlic bread. Should we order some for you?"
	wants_garlic_bread = get_truefalse_answer(garlic_question)

	# Would you like to enroll in the company’s health insurance?
	insurance_question = "\nWould you like to enroll in the company’s health insurance?"
	wants_insurance = get_truefalse_answer(insurance_question)

	responses = [name, age_consistent, wants_garlic_bread, wants_insurance]

	return responses

end


def report_results(responses)
	
	vampire_results = test_responses(responses)

	puts "Calculating results... \n...\n"

	puts vampire_results

end


report_results(conduct_survey)

