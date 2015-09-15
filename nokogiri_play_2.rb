require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("https://www.thinkgeek.com/homeoffice/food-caffeine/feature/desc/0/all"))
puts page.class
puts '---'
puts page.css('title')
puts '---'
items = page.xpath("//div/a/h4").collect {|node| node.text}
puts items
prices = page.xpath("//div[contains(@class,'product')]/p[not(contains(@class,'outofstock'))]/text()").collect {|node| node.text.strip}
prices.delete("")
puts prices

items.zip(prices).each do |title, price|
  puts title+" "+price
end
