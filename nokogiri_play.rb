require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://en.wikipedia.org/wiki/HTML"))
puts page.class
puts '---'
page.css('table.infobox th').each {|el| puts el.text}

