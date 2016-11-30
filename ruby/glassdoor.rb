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

  DRIVER.find_element(class: "search").click
end

def click_jobs
  job_listings = DRIVER.find_elements(class: 'applyText')

  job_listings.each_with_index do |job_listing, index|
    puts "This is job_listing #{index}"
    job_listing.click

    sleep(1)

    DRIVER.find_element(class: 'mfp-close').click if index == 0

    sleep(1)

byebug
    apply_button = DRIVER.find_element(class: 'ezApplyBtn')
    apply_button.click

    sleep(1)

    apply

    sleep(2)
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
end

DRIVER = Selenium::WebDriver.for :chrome
DRIVER.get("https://www.glassdoor.com/index.htm")

sleep(7)

sleep(2)
find_jobs
sleep(2)
click_jobs
sleep(90000)
