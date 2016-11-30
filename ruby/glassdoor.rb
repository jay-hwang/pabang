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
  location = DRIVER.find_element(id: "LocationSearch")
  location.clear
  sleep(1)

  location.send_keys("San Francisco, CA")
  sleep(1)
  DRIVER.find_element(id: "KeywordSearch").send_keys("#{JOBS[0]}")

  sleep(1)

  DRIVER.find_element(class: "search")
end

def clickJobs
  job_listings = DRIVER.find_elements(class: 'applyText')

  first_job = job_listings.first

  first_job.click

  sleep(2)

  DRIVER.find_element(class: 'mfp-close').click

  sleep(2)

  apply_button = DRIVER.find_element(class: 'ezApplyBtn')

  sleep(2)

  apply_button.click
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

DRIVER = Selenium::WebDriver.for :chrome
DRIVER.get("https://www.glassdoor.com/index.htm")


sleep(2)
find_jobs.click
sleep(2)
clickJobs
sleep(2)
apply
sleep(90000)
