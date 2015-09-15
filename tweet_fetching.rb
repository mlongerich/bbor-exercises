require 'rubygems'
require 'oauth'
require 'json'

consumer_key = OAuth::Consumer.new(
  "JlQ2lv0DwLEK6r22P31GgK6yA",
  "dypJec13mv0oyJ7sQgBGMGckEyWgf1z3FQfQZYnpvoZZ7uIeW5")
access_token = OAuth::Token.new(
  "17644349-RGRB1ukzz11ePudQLqzjgHwrBQxHWHWUMU16pxLpd",
  "3mYhZ7aOlnMyFUqDtg5629VfND66WBhjCSLaVK4qG7NWS")

baseurl = "https://api.twitter.com"
path = "/1.1/statuses/user_timeline.json"
screen_name = "engadget"
query = URI.encode_www_form("screen_name" => screen_name, "count" => 100)
address = URI("#{baseurl}#{path}?#{query}")

my_local_filename = screen_name + "-tweets.json"

http = Net::HTTP.new address.host, address.port
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER

def print_timeline_over_10_retweets(tweets)
  tweets.each do |tweet| 
    if tweet["retweet_count"] > 100
      puts ''
      puts "Screen Name: #{tweet['user']['screen_name']}"
      puts "User Name: #{tweet['user']['name']}"
      puts "User Created On: #{tweet['user']['created_at']}"
      puts "Total Tweets: #{tweet['user']['statuses_count'].to_s}"
      puts "Tweet: #{tweet['text']}"
      puts "Tweet Date: #{tweet['created_at']}"
      puts "Retweet Count: #{tweet['retweet_count']}"
    end
  end
end
  
request = Net::HTTP::Get.new address.request_uri
request.oauth! http, consumer_key, access_token
http.start
response = http.request(request)
if response.code == '200' 
  tweets = JSON.parse(response.body)
  print_timeline_over_10_retweets(tweets)
  puts "---"
  puts tweets.first['created_at']
  puts tweets.first['text']
  puts "---"
  puts tweets.last
  my_local_file = open(my_local_filename, "w")
  my_local_file.write(tweets)
  my_local_file.close
end


