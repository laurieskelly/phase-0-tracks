with open('names.dat','r') as infile:
	names = file.read(infile)

names = [n.split()[0] for n in names.split('\n')]
print repr(names)

with open('name_array.dat','w') as outfile:
	outfile.write(repr(names))