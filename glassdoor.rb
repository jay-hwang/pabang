require "selenium-webdriver"
require "byebug"

DRIVER = Selenium::WebDriver.for :chrome

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
  DRIVER.find_element(id: "KeywordSearch").send_keys("software engineer")

  sleep(2)

  location = DRIVER.find_element(id: "LocationSearch")
  location.clear

  sleep(2)

  location.send_keys("San Francisco, CA")

  sleep(2)

  DRIVER.find_element(class: "search")
end

DRIVER.get("https://www.glassdoor.com/index.html")
sleep(2)
find_jobs.click
