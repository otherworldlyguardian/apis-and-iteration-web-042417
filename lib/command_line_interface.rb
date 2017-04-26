def welcome
  puts "Welcome to the Star Wars API data comber."
end

def get_about_from_user
  puts "What do you want to know more about?(1-6)"
  info_list
  input = gets.chomp.to_i
  until input >= 1 && input <= 6
  	puts "Please input a valid number (1-6)."
  	input = gets.chomp.to_i
  end
  define_topic(input)
end

def get_info_from_user(name)
  puts "What about this #{name} do you want to know more of?(1-4)"
  info_list
  input = gets.chomp.to_i
  until input >= 1 && input <= 4
  	puts "Please input a valid number (1-4)."
  	input = gets.chomp.to_i
  end
  if input == 1
  	"characters"
  else
  	define_topic(input) #stored in variable 'about'
  end
end

#----------Helper Methods-------------
def which_question(about)
	case about
		when "people"
			puts "Which person?"
		when "planets"
			puts "Which planet?"
		when "films"
			puts "Which film?"
		when "species"
			puts "Which species?"
		when "vehicles"
			puts "Which vehicle?"
		when "starships"
			puts "Which starship?"
	end
end

def info_list
	puts "1. People"
	puts "2. Planets"
	puts "3. Films"
	puts "4. Species"
	puts "5. Vehicles"
	puts "6. Starships"
end

def define_topic(input)
	case input
		when 1
			"people" 
		when 2
			"planets" 
		when 3
			"films"
		when 4
			"species"
		when 5
			"vehicles"
		when 6
			"starships"
	end
end