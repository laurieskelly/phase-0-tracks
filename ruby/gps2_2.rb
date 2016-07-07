# Method to create a list
def create_list(itemstring = "")
	# input: string of (one-word) items separated by commas
	# output: array of 2-item arrays [item, quantity]

	list = []
	# steps: 
	# parse string into pieces
	items = itemstring.split(",")
	# add each item with default quantity nil 
	items.each do |item|
		list = add_item(list, item, qty=nil, print=false)
	end
	puts "\n\nList created.\n"
	# print the list to the console 
	print_list(list)
	return list
end

# Method to add an item to a list
def add_item(list, item, qty=nil, print=true)
	# input: 
	#   existing list, 
	#   item name (string), 
	#   quantity qty (int or string or nil(default)), 
	#   print? (t(default)/f)
	# output: updated list (array)
	
	# format list item 
	if qty
		qty = qty.to_s
	end
	item = [item.strip.capitalize, qty]
	# append to list
	list = list.push(item)
	# print list if print=true
	if print
		puts "\n\nList updated: added item '#{item}'\n"
		print_list(list)
	end
	return list
end

# Method to improve DRY
def find_item(list, itemname)
	# input: list, name of item(string)
	# output: index of matching element from list (integer) or nil

	found = false
	counter = 0
	# iterate through items looking for match
	for item, qty in list
		# remove matching item from list
		if item.downcase.strip == itemname.downcase.strip
			return counter
		end
		counter += 1
	end
	return nil
end

# Method to remove an item from the list
def remove_item(list, removeitem)
	# input: existing list, item name
	# output: updated list

	match_index = find_item(list, removeitem)
	# alert if not found
	if not match_index
		msg  =  "\n\n** WARNING remove_item failure: item \"#{removeitem}\" "
		msg += "not found in list. List unchanged **"
		return list
	else			
		list.delete_at(match_index)
		puts "\n\nList updated: item '#{removeitem}' removed from list.\n"
		print_list(list) if print
		return list
	end
	# return updated list
	
end
	
# Method to update the quantity of an item
def update_item_quantity(list, updateitem, new_qty, print=true)
	# input: list, item name (string), new quantity (int or string)
	# output: updated list

	match_index = find_item(list, updateitem)
	if not match_index
		# alert if not found
		msg  =  "\n\n** WARNING update_item_quantity failure: item "
		msg += "\"#{removeitem}\" not found in list. List unchanged. **"
		return list
	else			
		# update list
		list.delete_at(match_index)
		list.insert(match_index, [updateitem.strip.capitalize, new_qty.to_s])
		# print success message
		msg  = "\n\nList updated: item '#{updateitem}' quantity "
		msg += "updated to '#{new_qty}'.\n"
		puts msg
		# print updated list
		print_list(list) if print
		return list
	end
end

# Method to print a list and make it look pretty
def print_list(list)
	# input: list
	# output: none

	# print header
	puts "Grocery List\n------------"
	# iterate over list
	for item, qty in list do
		# print each item to screen ex: " - Lemonade, 2 liters"
		puts " - #{item}, #{qty}"
	end

end

# Create a new list
teststring = "lemonade, tomatoes, onions, ice cream"
list = create_list(teststring)

# Add the following items to your list
quantities = {
	"lemonade" => "2 liters",
	"tomatoes" => 3, 
	"onions" => 1, 
	"ice cream" => "2 pints"
}
for item, qty in quantities
	update_item_quantity(list, item, qty, print=false)
end
print_list(list)

# one more add_item test
list = add_item(list, "avocados", 3)

# Remove the Lemonade from your list
list = remove_item(list, "lemonade")
list = remove_item(list, "guacamole")

# Update the Ice Cream quantity to 1
list = update_item_quantity(list, "ice cream", 1)

# Print out your list (Is this readable and nice looking)?
