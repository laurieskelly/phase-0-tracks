require 'pp'

# http://listofrandomnames.com/
# reformatted with python because I'm lazy ./nested_data_helpers/names.py
names = ['Charlie', 'Claude', 'Eva', 'Ellen', 'Tameka', 'Adell', 'Masako', 'Wendi', 'Larue', 'Bessie', 'Tanna', 'Lekisha', 'Joseph', 'Reyes', 'Rubi', 'Larhonda', 'Quincy', 'Charissa', 'Kellye', 'Tianna', 'Zita', 'Thersa', 'Johnsie', 'Leena', 'Sharonda', 'Seema', 'Leonard', 'Valda', 'Darleen', 'Eleanor', 'Shanda', 'Jeanne', 'Georgiann', 'Kathlyn', 'Margene', 'Mauro', 'Janiece', 'Kris', 'Tracie', 'Emmie', 'Lavada', 'Jay', 'Darrell', 'Alia', 'Casie', 'Yessenia', 'Maple', 'Leigh', 'Quyen', 'Delora']
names = names.shuffle

committees = []
def new_committee(name)
	return {
		name: name,
		budget: 0,
		officers: {
			chair: '',
 			cochair: '',
  			secretary: ''
  		},
		members_at_large: [],
		meetings: []
	}
end

def new_meeting 
	return {
		date: '',
		in_attendance: [],
		minutes_filed: true
	}
end

def random_date 
	year = "2015"
	month = (Random.rand(11).to_i + 1).to_s.rjust(2, "0")
	day = (Random.rand(27).to_i + 1).to_s.rjust(2, "0")
	return [year, month, day].join("-")
end

def coin_flip(p=0.5)
	return Random.rand < p
end

def sample(stuff)
	n = stuff.length
	k = Random.rand(n-1).to_i 
	return stuff.shuffle[0..k]
end

for n in ["outreach", "program", "social"] 
	committees.push(new_committee(n))
end

for c in committees
	# budget
	c[:budget] = Random.rand(10).to_i * 1500
	
	# officers
	for k in c[:officers].keys
		c[:officers][k] = names.pop
	end

	# members at large
	num_members = Random.rand(5).to_i + 2
	num_members.times {c[:members_at_large].push(names.pop)}

	# # meetings
	num_meetings = Random.rand(4).to_i + 1
	num_meetings.times {c[:meetings].push(new_meeting)}
	for m in c[:meetings]
		# meeting date
		m[:date] = random_date
		# in attendance
		attended = []
		for o in c[:officers].values
			if coin_flip(p=0.8)
				attended.push(o)
			end
		end
		m[:in_attendance] = attended + sample(c[:members_at_large])
		# minutes_filed
		m[:minutes_filed] = coin_flip(p=0.3)

	end	



end

puts "committees = "
pp(committees)
puts

puts "1. co-chair of the social committee: #{ committees[2][:officers][:cochair] }"

outreach_meetings = committees[0][:meetings]
no_minutes = (outreach_meetings.keep_if {|x| not x[:minutes_filed]})
puts "2. number of outreach meetings with no minutes: #{no_minutes.length}"

answer = committees[1][:meetings][-1][:in_attendance]
puts "3. members attending the last listed meeting of the program committee:"
for a in answer
	puts "   - #{a}"
end

