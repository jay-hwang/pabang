require "selenium-webdriver"
require "byebug"

# JOBS = File.readlines('jobs.txt')

def handle_failure(err)
  puts "Something went wrong\n"
end

def closeBrowser
  DRIVER.quit
end

def find_jobs
  location = DRIVER.find_element(id: "LocationSearch")
  location.clear
  sleep(1)

  location.send_keys("San Francisco, CA")
  sleep(1)
  DRIVER.find_element(id: "KeywordSearch").send_keys("software engineer")

  sleep(1)

  DRIVER.find_element(class: "search")
end

def get_job_info
  job_listings = DRIVER.find_elements(class: 'jobListing')
  company = DRIVER.find_elements(css: 'span.showHH.inline.empName')
  location = DRIVER.find_elements(css: 'span.small.location')
  title = DRIVER.find_elements(css: 'span.title')

  job_listings.each.with_index do |listing, i|
    listing.click

    sleep(3)

    DRIVER.find_element(class: 'mfp-close').click if i == 0

    description = DRIVER.find_elements(css: 'div.jobDescriptionContent.desc')

    # puts "title: #{title[i].text}"
    # puts "company: #{company[i].attribute('innerHTML')}"
    # puts "location: #{location[i].attribute('innerHTML')}"
    # puts "description: #{description[i].text}"

    RESULT_FILE.puts("#{title[i].text}")
    RESULT_FILE.puts("#{company[i].attribute('innerHTML')}")
    RESULT_FILE.puts("#{location[i].attribute('innerHTML')}")
    RESULT_FILE.puts("#{description[i].text}")
    RESULT_FILE.puts("-------------------------")
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


RESULT_FILE = File.new('results.txt', 'w+')
RESULT_FILE.puts("Results Summary")
RESULT_FILE.puts("***************")
DRIVER = Selenium::WebDriver.for :chrome
DRIVER.get("https://www.glassdoor.com/index.htm")

sleep(10)

sleep(1)
find_jobs.click
sleep(1)
get_job_info
sleep(90000)
result_file.close
