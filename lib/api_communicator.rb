require 'rest-client'
require 'json'
require 'pry'

URL = "http://www.swapi.co/api/"

def get_about_from_api(about, name, info)
  about_hash = nil
  loop do 
    if about_hash == nil
      about_hash = parse_json(URL+"#{about}/")
    else
      about_hash = parse_json(about_hash['next'])
    end
    about_hash["results"].each do |topic|
      topic.each do |stats, value|
        if value.to_s.downcase == name
          return topic[info]
        end
      end
    end
  break if about_hash['next'] != 'null'
  end
end

def parse_info(info_hash, info)
  info_hash.each.with_index(1) do |topic, index|
    topic_info = JSON.parse(RestClient.get(topic))
    if info == "films"
      puts "#{index}. #{topic_info['title']}"
    else
      puts "#{index}. #{topic_info['name']}"
    end
  end
  # some iteration magic and puts out the movies in a nice list
end

def show_about_info(about, name, info)
  info_hash = get_about_from_api(about, name, info)
  parse_info(info_hash, info)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

def parse_json(url)
  JSON.parse(RestClient.get(url))
end