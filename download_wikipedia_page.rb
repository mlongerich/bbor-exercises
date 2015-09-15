require 'open-uri'

remote_base_url = "https://en.wikipedia.org/wiki"

start_year = 2003
end_year = 2005

compiled_filename = start_year.to_s + "-" + end_year.to_s + ".html"
puts "Creating: " + compiled_filename
compiled_file = open(compiled_filename, "w")

(start_year..end_year).each do |year|
  remote_full_url = remote_base_url + "/" + year.to_s
  puts "Downloading from: " + remote_full_url
  remote_data =  open(remote_full_url).read
  my_local_filename = "my_copy_of-" + year.to_s + ".html"
  puts "Writing to: " + my_local_filename

  my_local_file = open(my_local_filename, "w")
  my_local_file.write(remote_data)
  
  puts "Writing " + my_local_filename + " to " + compiled_filename
  compiled_file.write(remote_data)

  my_local_file.close

  sleep 1
end

puts compiled_filename + " complete."

compiled_file.close
