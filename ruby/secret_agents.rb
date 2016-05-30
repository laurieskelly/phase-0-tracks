def encrypt(str)
	
	puts "encrypting: #{str}"

	counter = 0
	
	# for each letter
	while counter < str.length

		# make sure it's not a space		
		if str[counter] != ' '

			if str[counter] == 'z'
				# edge case: z explicitly becomes a
				str[counter] = 'a'

			else
				# advance letter by one
				str[counter] = str[counter].next
			end

		end
		# advance counter	
		counter += 1
	end

	str
end
	

def decrypt(str)
	alph = "abcdefghijklmnopqrstuvwxyz"

	puts "decrypting: #{str}"
	
	counter = 0
	# for each character in the string
	while counter < str.length

		# make sure it's not a space
		if str[counter] != " " 
			# find out what index in the alphabet it is
			ind = alph.index(str[counter])
			# subtract 1
			new_ind = ind-1
			# replace letter with letter with index before it
			str[counter] = alph[new_ind]
			# increment the counter
		end
		counter += 1
	end
	str
end


### DRIVER CODE 

encrypted = encrypt('yo mama')
puts "answer: #{encrypted}"

decrypted = decrypt("zp nbnb")
puts "answer: #{decrypted}"

puts encrypt("abc")
puts encrypt("zed")
puts decrypt("bcd")
puts decrypt("afe")

puts "\nNested call! "

puts "answer: #{decrypt(encrypt("swordfish"))}"

# This nested call works because ruby interprets the calls from the inside
# out. i.e. - it encrypts "swordfish" and returns the encrypted 
# string, which can then be decrypted by decrypt()