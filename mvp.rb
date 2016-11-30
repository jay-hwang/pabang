require "selenium-webdriver"
require "byebug"

JOBS = File.readlines('jobs.txt')

def click_link(link)
  link.click
end

def handle_failure(err)
  puts "Something went wrong\n"
end

def closeBrowser
  DRIVER.quit
end

def find_jobs
  # byebug
  # DRIVER.find_element(id: "KeywordSearch").send_keys("software engineer")



  location = DRIVER.find_element(id: "LocationSearch")
  location.clear
  sleep(2)

  location.send_keys("San Francisco, CA")
  sleep(2)
  DRIVER.find_element(id: "KeywordSearch").send_keys("#{JOBS[0]}")

  sleep(2)

  DRIVER.find_element(class: "search")
end

def clickJobs
  job_listings = DRIVER.find_elements(class: 'jobListing')
  company = DRIVER.find_elements(css: 'span.showHH.inline.empName')
  location = DRIVER.find_elements(css: 'span.small.location')
  title = DRIVER.find_elements(css: 'span.title')

  job_listings.each.with_index do |listing, i|
    listing.click

    sleep(3)

    DRIVER.find_element(class: 'mfp-close').click if i == 0

    description = DRIVER.find_elements(css: 'div.jobDescriptionContent.desc')
    # industry = DRIVER.find_element(class: 'i-ind').attribute('innerHTML')

    puts "title: #{title[i].text}"
    puts "company: #{company[i].attribute('innerHTML')}"
    puts "location: #{location[i].attribute('innerHTML')}"
    puts "description: #{description[i].text}"

    # puts "this is title: #{title}"
    # puts "this is company: #{company}"
    # puts "this is industry: #{industry}"
    # puts "this is description: #{description}"
  end

end

def apply
  DRIVER.find_element(id: 'ApplicantName').send_keys('John Doe')
  sleep(5)
  DRIVER.find_element(id: 'ApplicantEmail').send_keys('john_doe@gmail.com')
  sleep(5)
  DRIVER.find_element(name: 'coverLetterHTML').send_keys(
    'This is my cover letter.'
  )
end

# Title: noMargTop margBotSm strong (class)
# Company name: empDetailsLink (class)
# Industry: i-ind (class)
# Description: jobDesc (class)



DRIVER = Selenium::WebDriver.for :chrome
DRIVER.get("https://www.glassdoor.com/index.htm")

sleep(10)

sleep(2)
find_jobs.click
sleep(2)
clickJobs
sleep(2)
sleep(90000)
