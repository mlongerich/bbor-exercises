require 'rest-client'
require 'json'

base_url = "http://maps.googleapis.com/maps/api/geocode/json?sensor=false&address="
address = "1400 Broadway, New York, NY"

query_address = base_url + address.gsub(' ', '+')
puts query_address

page = RestClient.get query_address
parsed_page = JSON.parse(page)
puts parsed_page
puts "Lat: " + parsed_page["results"][0]["geometry"]["location"]["lat"].to_s
puts "Lng: " + parsed_page["results"][0]["geometry"]["location"]["lng"].to_s
