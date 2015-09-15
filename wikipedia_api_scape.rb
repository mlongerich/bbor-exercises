require 'rubygems'
require 'rest-client'
require 'JSON'

WURL = 'http://en.wikipedia.org/w/api.php?action=opensearch&namespace=0&suggest=&search='

('A'..'Z').to_a.each do |letter|
  resp = RestClient.get("#{WURL}#{letter}", 'User-Agent' => 'Ruby')
  arr = JSON.parse(resp)
  puts arr[1].join(', ')
  sleep 0.5
end
