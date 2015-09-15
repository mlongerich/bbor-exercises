require 'rubygems'
require 'rest-client'

wiki_url = "http://www.wikipedia.org/"
wiki_local_file = "copied_wiki_page.html"

open(wiki_local_file, "w") do |file|
  file.write(RestClient.get(wiki_url))
end

contents = open(wiki_local_file, "r") do |file|
  file.read
end

puts contents
