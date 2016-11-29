def write_sites
  sites_file = File.new('sites.txt', 'w+')
  puts "Please enter the url of the site"
  print ">> ".chomp
  user_site_choices = gets.chomp!
  sites_file.puts(user_site_choices)
  sites_file.close
end

def write_keywords
  keywords_file = File.new('keywords.txt', 'w+')
  puts "Please enter specific keywords you would like to search for"
  user_keywords = []
  while (true)
    print ">> ".chomp
    current_keyword = gets.chomp!
    break if current_keyword.downcase == "done"
    user_keywords << current_keyword
  end

  keywords_file.puts(user_keywords.join("\n"))
  keywords_file.close
end

def read_file(file_name) #returns array of file's content
  file_content = []
  File.open(file_name, 'r') do |file|
    file.each_line do |line|
      line = line[0..-2] #take out carriage return character
      file_content << line
    end
  end

  p file_content
end
