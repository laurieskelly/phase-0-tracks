# # reference variables
# vowels
$vow = "aeiou".chars
# consonants
con =* (97..122)
con = con.map! {|x| x.chr}
$con = con.delete_if {|x| $vow.include? x}

# # methods
def get_next(list, ch)
	cur_position = list.index(ch)
	new_position = (cur_position+ 2) % list.length - 1
	return list[new_position]
end

def tokenize_and_reverse(real_name)
	return real_name.downcase.split.reverse
end

def rotate_letters(name)
	out = []
	for ch in name.chars

		if ch == " "
			out.push(ch)
		elsif $vow.include? ch
			out.push(get_next($vow, ch))
		else
			out.push(get_next($con, ch))
		end
	end
	return out.join("")
end

def create_code_name(real_name)
	last_first = tokenize_and_reverse(real_name)
	code_name = []
	for name in last_first
		name = rotate_letters(name).capitalize
		code_name.push(name)
	end
	return code_name.join(" ")
end


# # main
def main()
	codenames = {}

	ex = "Felicia Torres"
	puts "Enter a real name <First> <Last> to get a codename assigment."
	puts "Example: if you enter '#{ex}', you'll be assigned '#{create_code_name(ex)}'\n\n"

	while true

		# prompt for name & capture
		puts "Real name: "
		real_name = gets.chomp 

		# print codename
		code_name = create_code_name(real_name)
		puts "Code name: \n#{code_name}\n\n"

		# push to array
		codenames[real_name] = code_name

		# another? 
		while true
			puts "Would you like to create another?"
			puts "y: make another codename \nn: see all codenames and exit"
			more = gets.chomp

			if ["y", "n"].include? more
				more = more == "y"
				break
			end
			puts "Oops, enter a letter in {y,n} only."
		end

		if not more 
			break
		end
	end

	puts "Here are your codenames: "
	for (k,v) in codenames
		puts "#{k.ljust(20)} will go by codename: #{v}"
	end
end

main

