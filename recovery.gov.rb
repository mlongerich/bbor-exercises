require 'rubygems'
require 'rest-client'
require 'json'

URL = "http://www.recovery.gov/Sandy/whereisthemoneygoing/maps/Pages/ContractAwardData.aspx"

resp = RestClient.get("#{URL}")
arr = JSON.parse(resp)
puts arr["results"]
# puts "---"
# arr["results"].each {|value| puts value["value"] }
