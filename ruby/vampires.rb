puts "Hello. Please provide truthful responses to the following questions. \n"

# What is your name?
puts "What is your name?"
name = gets

puts "Thank you, " + name 

# How old are you? What year were you born?
puts "How old are you?"
age = gets

puts "Also, what year were you born?"
year_born = gets



def get_truefalse_answer(question)

	validated_answer = nil
#	valid_ans = ['y','n']

	while validated_answer == nil
		puts question + " (y/n)"
		ans = gets

		if ans.equal? yes
			validated_answer = true
		elsif ans.to_s.eql? "n".to_s
			validated_answer = false
		else
			puts "Oops, please respond only with 'y' or 'n'.\n"
		end
	end

	# # convert y/n to boolean
	# result = true
	# if validated_answer == 'n'
	# 	result = false
	# end

	return validated_answer
end

# Our company cafeteria serves garlic bread. Should we order some for you? 
garlic_question = "Our company cafeteria serves garlic bread. Should we order some for you?"
# wants_garlic_bread = get_truefalse_answer(garlic_question)
puts garlic_question + " (y/n)"
wants_garlic_bread = gets

# Would you like to enroll in the company’s health insurance?
insurance_question = "Would you like to enroll in the company’s health insurance?"
# wants_insurance = get_truefalse_answer(insurance_question)
puts insurance_question + " (y/n)"
wants_insurance = gets

results = [name, age, year_born, wants_garlic_bread, wants_insurance]

puts results




