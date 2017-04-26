require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  character_hash = JSON.parse(RestClient.get("http://www.swapi.co/api/people/"))
  while character_hash['next'] != 'null'
    character_hash["results"].each do |char|
      char.each do |stats, value|
        if value.to_s.downcase == character
          return char['films']
        end
      end
    end
    character_hash = JSON.parse(RestClient.get(character_hash['next']))
  end
end

def parse_character_movies(films_hash)
  films_hash.each.with_index(1) do |film, index|
    film_info = JSON.parse(RestClient.get(film))
    puts "#{index}. #{film_info["title"]}"
  end
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
