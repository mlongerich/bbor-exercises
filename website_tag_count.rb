require "open-uri"
def count_tags(url, *tag)

  page = open(url).read

  tag.each do |t|
    pattern = /<#{t}\b/ 
    tags = page.scan(pattern)
    puts "The site #{url} has #{tags.length} #{t} tags"
  end
end
