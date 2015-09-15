require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://ruby.bastardsbook.com/files/hello-webpage.html"))
puts page.class
puts '---'
puts page.css('title')
puts '---'
puts page.css('li')
puts '---'
puts page.css('li')[0].text
puts '---'
puts page.css('li a')[1].attribute('href')
puts '---'
puts page.xpath('//li/a').attribute('href')
puts '---'
page.xpath('//li/a[contains(@data-category, "news")]').each {|line| puts line.attribute('href')}
puts '---'
page.css('li a').select{|link| puts link['href'] if link['data-category'] == 'news'}
puts '---'
page.css('li a[data-category=news]').select{|link| puts link['href']}
puts '---'
puts page.css('div#funstuff')[0]
puts '---'
page.css('div#references a').each {|link| puts link.text+": "+link['href']}

