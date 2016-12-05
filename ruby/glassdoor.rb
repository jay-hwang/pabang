require_relative "../modules/selenium.rb"
require_relative "../modules/io.rb"
require "byebug"

include IOStream
include Selenium

DRIVER = Selenium::DRIVER
WAIT = Selenium::WebDriver::Wait.new(timeout: 60)

def handle_failure(err)
  puts "Something went wrong\n"
end

def closeBrowser
  DRIVER.quit
end

def glassdoor_signin
  signin
end

def find_jobs
  location = IOStream::input_locations
  position = IOStream::input_positions

  location_input = DRIVER.find_element(id: "LocationSearch")
  location_input.clear
  location_input.send_keys("San Francisco, CA")

  position_input = DRIVER.find_element(id: "KeywordSearch")
  position_input.send_keys(position)

  DRIVER.find_element(class: "search")
end

def get_job_info
  # glassdoor_job_listings selects only the listings where you can apply
  # directly through glassdoor
  glassdoor_job_listings = DRIVER.find_elements(class: 'applyText')

  # job_listings = DRIVER.find_elements(class: 'jobListing')
  companies= DRIVER.find_elements(css: 'span.showHH.inline.empName')
  locations = DRIVER.find_elements(css: 'span.small.location')
  titles = DRIVER.find_elements(css: 'span.title')

  glassdoor_job_listings.each.with_index do |listing, i|
    break if i > 0

    listing.click

    sleep(1)

    DRIVER.find_element(class: 'mfp-close').click if i == 0

    description = DRIVER.find_elements(
      css: 'div.jobDescriptionContent.desc'
    )

    sleep(1)

    DRIVER.find_element(class: 'ezApplyBtn').click

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

  DRIVER.switch_to.window DRIVER.window_handles.first

byebug

  resume_select = DRIVER.find_element(id: "ExistingResumeSelectBoxIt")
  resume_select.click
  sleep(1)
  resume_file = DRIVER.find_element(data_val: "resume.pdf")
  resume_file.click

  byebug
end

def gmail_signin
  glassdoor_window = DRIVER.window_handle

  DRIVER.find_element(id: 'GoogleDriveBtn').click

  sleep(1) until DRIVER.window_handles.count == 2

  DRIVER.switch_to.window DRIVER.window_handles.last

  email_input = DRIVER.find_element(id: 'Email')
  email_input.send_keys('')
  next_button = DRIVER.find_element(id: 'next')
  next_button.click
  sleep(1)
  password_input = DRIVER.find_element(id: 'Passwd')
  password_input.send_keys('')
  signin_button = DRIVER.find_element(id: 'signIn')
  signin_button.click
end

DRIVER.get("https://www.glassdoor.com/index.htm")

sleep(10)

sleep(1)
find_jobs.click
sleep(1)
get_job_info
sleep(90000)
