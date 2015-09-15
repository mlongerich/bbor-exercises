require "open-uri"
# url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"
# puts open(url).readline

# open("hamlet.txt", "w") do |file|
#   file.write(open(url).read)
# end

# puts "---"

open("hamlet.txt", "r") do |file|
  file.readlines.each_with_index do |line, number|
    puts line if number%42 == 41
  end
end

puts "---"

open("hamlet.txt", "r") do |file|
  file.readlines.each do |line|
    puts line if line.match("  Ham.")
  end
end
