require "selenium-webdriver"
require "byebug"

JOBS = File.readlines('jobs.txt')

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

def get_job_info
  # job_listings = DRIVER.find_elements(class: 'jobListing')
  glassdoor_job_listings = DRIVER.find_elements(class: 'applyText')
  company = DRIVER.find_elements(css: 'span.showHH.inline.empName')
  location = DRIVER.find_elements(css: 'span.small.location')
  title = DRIVER.find_elements(css: 'span.title')

  glassdoor_job_listings.each.with_index do |listing, i|
    break if i > 0

    listing.click

    sleep(1)

    DRIVER.find_element(class: 'mfp-close').click if i == 0

    description = DRIVER.find_elements(css: 'div.jobDescriptionContent.desc')

    sleep(1)

    DRIVER.find_element(class: 'ezApplyBtn').click
    # puts "title: #{title[i].text}"
    # puts "company: #{company[i].attribute('innerHTML')}"
    # puts "location: #{location[i].attribute('innerHTML')}"
    # puts "description: #{description[i].text}"

    sleep(1)
    apply
  end

end

def apply
  DRIVER.find_element(id: 'ApplicantName').send_keys('John Doe')
  sleep(1)
  DRIVER.find_element(id: 'ApplicantEmail').send_keys('john_doe@gmail.com')
  sleep(1)
  DRIVER.find_element(name: 'coverLetterHTML').send_keys(
    'This is my cover letter.'
  )
  sleep(1)
  gmail_signin
end

def gmail_signin
  glassdoor_window = DRIVER.window_handle
sleep(1)
  DRIVER.find_element(id: 'GoogleDriveBtn').click
sleep(1)
  DRIVER.switch_to.window DRIVER.window_handles.last

  puts "window handles: #{DRIVER.window_handles}"
  puts "last: #{DRIVER.window_handles.last}"
  puts("DRIVER.window_handle #{DRIVER.window_handle}")
  puts("email_input: #{DRIVER.find_element(id: 'Email')}")

  debugger

  email_input = DRIVER.find_element(id: 'Email')
  email_input.send_keys('jayhwang0121@gmail.com')
  next_button = DRIVER.find_element(id: 'next')
  next_button.click
  sleep(1)
  password_input = DRIVER.find_element(id: 'Passwd')
  password_input.send_keys('name1ess')
  signin_button = DRIVER.find_element(id: 'signIn')
  signin_button.click
end

DRIVER = Selenium::WebDriver.for :chrome
WAIT = Selenium::WebDriver::Wait.new(timeout: 60)

DRIVER.get("https://www.glassdoor.com/index.htm")

sleep(10)

sleep(1)
find_jobs.click
sleep(1)
get_job_info
sleep(90000)
