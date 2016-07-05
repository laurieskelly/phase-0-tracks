def array_of_three(elem1, elem2, elem3)

	return [elem1, elem2, elem3]

end

def add_to_array(arr, elem)

	return arr + [elem]

end

puts 'RELEASE 1'
puts
# RELEASE 1
# 1. Initialize an empty array and store it in a variable (you can choose the name). Print the variable using p.
a = []
p a 
puts

# 2. Add five items to your array. Print the array.
a = a + [1, 2, 3, 4, 5]
p a 
puts

# 3. Delete the item at index 2. Print the array.
a.delete_at(2)
p a
puts

# 4. Insert a new item at index 2. Print the array.
a.insert(2,9)
p a
puts

# 5. Remove the first item of the array without having to refer to its index. Print the array.
a.delete(1)
p a
puts

# 6. Ask the array whether it includes a certain item. Print the result of this method call (labeled so it prints as more than just an isolated boolean value without any context.)
puts "Does the Array contain the number 5?"
p a.include? 5
puts

# 7. Initialize another array that already has a few items in it.
b = ["cat", "dog", "Taylor Swift"]

# 8. Add the two arrays together and store them in a new variable. Print the new array.
c = a + b
p c
puts

puts "\nRELEASE 2"
# RELEASE 2

puts "\narray_of_three(1, \"two\", nil)"
d = array_of_three(1, "two", nil)
p d

puts "\nadd_to_array(d, \"added\")"
e = add_to_array(d, "added")
p e

puts "\nadd_to_array([], 1)"
f = add_to_array([], 1)
p f

puts "\nadd_to_array([\"some\", \"stuff\"], [\"array as element!\"])"
g = add_to_array(["some", "stuff"], ["array as element!"])
p g