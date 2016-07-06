# # # Initialize some stuff
# data keys and question prompts 
$symbols_prompts = {
	first_name: 'What is the first name?',
	last_name: 'Last name?',
	is_new: 'Is this a first-time client?',
	referral: 'Whom may we thank for a new client referral?',
	age: 'Client\'s age? (approximate if unknown)',
	has_children: 'Does the client have children?',
	children_at_home: 'How many children live at home?',
	decor_theme: 'What is the decor theme? (input number)',
	decor_theme_other: 'Input custom decor theme:',
	budget: 'What is the client budget?',
}
# extra data for fancy category
$decor_themes = ["modern", "shabby chic", "rococo", "man cave", "eccentric", "other", "none"]
# for skipping follow-up questions after a true/false answer is false
$skip = false
# initialize client data hash
$client_data = {}

# # METHODS
# method for parsing boolean question responses
def parse_boolean(resp)

	first = resp.strip.downcase[0]
	if ['y', 't'].include? first
		answer = true
	elsif ['n', 'f'].include? first
		answer = false		
	else
		answer = nil
	end

	return answer
end

# method for asking questions
def ask_question(key, prompt=nil)

	if prompt == nil
		prompt = $symbols_prompts[key]
	end

	# ask and get answer
	puts "\n" + prompt + "\n"

	# special case for question display for $decor_themes
	if key == :decor_theme
		$decor_themes.each_with_index do |choice, index|
		
			puts (index + 1).to_s + ". " + choice.capitalize + "\n"
		end
		resp = gets.strip.to_i - 1		
		if $decor_themes[resp] != "other"
			$skip = true
		end
	else
		resp = gets.chomp
	end

	# parse/convert boolean and skip if indicated
	if ["is", "has"].include? key.to_s.split("_")[0]
		resp = parse_boolean(resp)
		$skip = (not resp)
	end

	
	return resp
end


# # # Convert any user input to the appropriate data type.
def clean_data(cd=$client_data)
	# (booleans already converted)
	# age
	cd[:age] = clean_age(cd)

	# number of children
	if cd[:has_children]
		cd[:children_at_home] = clean_cah(cd)
	end

	# decor theme
	cd[:decor_theme] = (clean_decor(cd))

	# budget
	cd[:budget] = clean_budget(cd)

	return cd
end

# data-cleaning methods
def clean_age(cd)
	return cd[:age].to_i
end

def clean_cah(cd)
	nchil_str = cd[:children_at_home].to_s
	return nchil_str.strip.to_i
end

def clean_decor(cd)
	dt = cd[:decor_theme] 
	if not dt.class == Array
		theme = $decor_themes[dt]
		return dt, theme
	else
		return dt[0], dt[1]
	end
end

def clean_budget(cd)
	clean_budget = cd[:budget].to_s.scan(/\d/)
	clean_budget = clean_budget.join('').to_i
	cd[:budget] = clean_budget
end

# Print the hash back out to the screen when the designer has answered all of the questions.
def print_responses()
	puts "\nYour responses\n--------------\n\n"

	$client_data.each do |k,v|
		puts k.to_s + ":  " + v.to_s
	end

	puts "\n--------------\n\n"
end

# # # Give the user the opportunity to update a key 
def correct_one_or_exit()

	puts "MULLIGANS\n---------\n"
	puts "Enter a data field to fix an error, or enter 'none' to save and exit."
	fix_resp = gets.strip.downcase

	# If the designer says "none", skip it. 
	if fix_resp == 'none'
		puts "\n\nNo fixes! Entry saved.\n Goodbye!"
		return
	else
		fix_key = fix_resp.to_sym
	end

	# But if the designer enters "decor_theme" (for example) your program should 
	# ask for a new value and update the :decor_theme key. 

	# check that they entered a valid key (if not, gives instructions for future)
	if not $client_data.keys.include? fix_key
		puts "Invalid field name!"
		puts "Don't worry. You can change client data from the client management interface later."
		puts "\nGoodbye!"
	else
		puts "\nUpdating " + fix_resp + ":"
		
		# ask question
		corrected_resp = ask_question(fix_key)
		# update client_data
		$client_data[fix_key] = corrected_resp
		# clean it again 
		# (it's a small waste to clean everything but it's not a big hash)
		clean_data

		# print latest
		print_responses
		# exit
		puts "\nThank you! Goodbye."
	end
end

def main()
	# # # Prompt the designer/user for all of this information.
	# greet user
	puts "\nWelcome, esteemed alpha tester, to DesignClient v0.1! \n"
	puts "Please enter the details to store a new client.\n\n"

	# get all data
	$symbols_prompts.each do |(key, p)|
		# skip a question if the question should be skipped
		if $skip == true
			$skip = false
			next
		end
		resp = ask_question(key, prompt=p)
		$client_data[key] = resp
	end
	puts "\nEND of QUESTIONS.\n\n"

	# Convert any user input to the appropriate data type.
	clean_data
	# print data
	print_responses
	# Give the user the opportunity to update a key 
	correct_one_or_exit

end

main()


