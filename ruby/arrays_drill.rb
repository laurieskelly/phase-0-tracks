# 1. Initialize an empty array and store it in a variable (you can choose the name). Print the variable using p.
a = []
p a 

# 2. Add five items to your array. Print the array.
a = a + [1, 2, 3, 4, 5]
p a 

# 3. Delete the item at index 2. Print the array.
a.delete_at(2)
p a

# 4. Insert a new item at index 2. Print the array.
a.insert(2,9)
p a

# 5. Remove the first item of the array without having to refer to its index. Print the array.
a.delete(1)
p a

# 6. Ask the array whether it includes a certain item. Print the result of this method call (labeled so it prints as more than just an isolated boolean value without any context.)
puts "Does the Array contain the number 5?"
p a.include? 5

# 7. Initialize another array that already has a few items in it.
b = ["cat", "dog", "Taylor Swift"]

# 8. Add the two arrays together and store them in a new variable. Print the new array.
c = a + b
p c