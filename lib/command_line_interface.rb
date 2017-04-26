def welcome
  puts "Welcome to the Star Wars API data comber."
end

def get_about_from_user
  puts "What do you want to know more about?(1-4)"
  info_list
  input = gets.chomp.to_i
  until input >= 1 && input <= 4
  	puts "Please input a valid number (1-4)."
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
  define_topic(input)
end

def get_title_from_user(about)
	if about == "people"
		puts "Which person?"
	else
		puts "Which #{about}?"
	end
	gets.chomp
end

def info_list
	puts "1. People"
	puts "2. Films"
	puts "3. Vehicles"
	puts "4. Starships"
end

def define_topic(input)
	case input
		when 1
			"people" 
		when 2
			"films" 
		when 3
			"vehicles"
		when 4
			"starships"
	end
end