# write a method that takes a block
def react_to(stuff)
	puts "Here we go..."
	if block_given?
		stuff.each {|thing| yield(thing)}
	end
	puts "The end"
end

puts "Release 0: \n"
list_of_stuff = ["a tiger", "my mom", "a sandwich"]

react_to(list_of_stuff) {|thing| puts "omg! it's #{thing}!!"}


# -----------------------------------------------------------------------------------------

def lucky_number(word)
	luck = 0
	counter = 1
	word.chars.each {|letter| luck += letter.ord}
	return luck
end

puts "\n\nRelease 1:\n"

numerology = ["red", "orange", "yellow", "green", "blue", "purple"]
day_moods = {
	:sunday => "contemplative",
	:monday => "remorseful",
	:tuesday => "energetic",
	:wednesday => "compassionate",
	:thursday => "hopeful",
	:friday => "overcaffeinated",
	:saturday => "sleeping",
}

puts "rainbow numbers! (using .each)"
puts "--array before: #{numerology}"
numerology.each {|color| puts "the lucky number for #{color} is #{lucky_number(color)}"}
puts "--array after: #{numerology}\n\n"

puts "rainbow numbers! (using .map)"
puts "--array before: #{numerology}"
puts "Here are all the lucky numbers: "
p numerology.map {|color| lucky_number(color)}
puts "--array after: #{numerology}\n\n"

puts "rainbow numbers! (using .map!)"
puts "--array before: #{numerology}"
puts "Here are all the lucky numbers: "
p numerology.map! {|color| lucky_number(color)}
puts "--array after: #{numerology}\n\n"

puts "days and moods! (using #each(Hash))"
puts "--hash before: #{day_moods}"
day_moods.each {|day, mood| puts "On #{day.to_s.capitalize}s, I am #{mood}."}
puts "--hash after: #{day_moods}"


# -----------------------------------------------------------------------------------------

puts "\n\nRelease 2:\n"
a =* (1..10)
puts "--Array: #{a}"

# 1. iterates through the items, deleting any that meet a certain condition
b = a.delete_if {|x| x%2 == 0}
puts "#delete_if even:  #{b}"

# 2. filters a data structure for only items that do satisfy a certain condition
a =* (1..10)
c = a.keep_if {|x| x%2 == 0}
puts "#keep_if even: #{c}"

# 3. different method that filters a data structure for only items satisfying a certain condition
a =* (1..10)
d = a.reject {|x| x % 3 == 0}
puts "#reject elements divisible by 3: #{d}"

# 4. remove items from a data structure until the condition in the block evaluates to false
a =* (1..10)
e = a.drop_while {|x| x < 5}
puts "#drop_while element less than 5: #{e}"

# ------------
def hash_refresh
	h = {}
	for x in (1..9)
		h[x] = 10 - x
	end
	return h
end
a = hash_refresh
puts "\n--Hash: #{a}"

# 1. iterates through the items, deleting any that meet a certain condition
b = a.delete_if {|k, v| k == v}
puts "#delete_if key == val:  #{b}"

# 2. filters a data structure for only items that do satisfy a certain condition
a = hash_refresh
c = a.keep_if {|k, v| v % k == 0}
puts "#keep_if value divisible by key: #{c}"

# 3. different method that filters a data structure for only items satisfying a certain condition
a = hash_refresh
d = a.reject {|k, v| v % 2 == 0}
puts "#reject value is even: #{d}"

# 4. remove items from a data structure until the condition in the block evaluates to false
a = hash_refresh
e = a.drop_while {|k, v| k < 5}
puts "#drop_while key less than 5: #{Hash[e]}"

