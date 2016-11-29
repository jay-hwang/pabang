sites_file = File.new('sites.txt', 'w+')
puts "Please enter the url of the site"
p ">> ".chomp
user_site_choices = gets.chomp!
sites_file.puts(user_site_choices)
sites_file.close
