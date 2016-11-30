class IOStream
  def self.write_sites
    sites_file = File.new('sites.txt', 'w+')
    puts "Please enter the url of the site"
    print ">> ".chomp
    user_site_choices = gets.chomp!
    sites_file.puts(user_site_choices)
    sites_file.close
  end

  def self.write_keywords
    keywords_file = File.new('keywords.txt', 'w+')
    puts "Please enter specific keywords you would like to search for"
    puts "Type 'done' when you are finished to exit the prompt"
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

  def self.write_jobs
    jobs_file = File.new('jobs.txt', 'w+')
    puts "Please enter the job positions you are looking for"
    puts "Type 'done' when you are finished to exit the prompt"
    user_jobs = []

    while true
      print ">> ".chomp
      current_job = gets.chomp!
      break if current_job == 'done'
      user_jobs << current_job
    end

    jobs_file.puts(user_jobs.join("\n"))
    jobs_file.close
  end

  def self.write_location
    location_file = File.new('location.txt', 'w+')
    puts "Please enter the location you would like to work"
    print ">> "
    user_location = gets.chomp!

    location_file.puts(user_location)
    location_file.close
  end

  def self.read_file(file_name) #returns array of file's content
    file_content = []
    File.open(file_name, 'r') do |file|
      file.each_line do |line|
        line = line[0..-2] #take out carriage return character
        file_content << line
      end
    end

    p file_content
  end
end

IOStream.write_jobs
