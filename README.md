# Pabang Webcrawler

### Background

Pabang Webcrawler is a web browser automation script for Glassdoor, Hired, and LinkedIn that utilizes the Selenium webdriver.

Created by Humza Baig, Jay Hwang, and Michael Pak.

### Description

The user input keywords that trigger their corresponding action:

- [Keyword] Website
The script takes a keyword [Glassdoor, Hired, LinkedIn] as an input and formats the keyword using Regex. The modified keyword triggers the webcrawler through Selenium webdriver, which opens the specified website's job listings page.

- [Keyword] Search Criteria
The script takes additional keywords ex. [Software Engineer, Back-end, Front-end, Full Stack], which is parsed with Regex to ensure the keywords meet the website's input format. The webcrawler is triggered displaying all relevant job postings within the website.

- [Index] Job Postings List
The script parse through the results and stores relevant information related to the job posting ex. (Title of Job, Relevant Dates, Location). With the gathered information, the script will numerically display a user-friendly list of all job postings that met the search criteria. Inputting a number will open that particular job listing in the web browser.

### Additional Features

1) Job Posting Criteria Keywords

The script takes additional keywords [Ruby, Python, Leadership, Teamwork] desired in the job posting.

2) Job Posting Filter Keywords

The script takes additional keywords [CEO, Vice-President, No-Salary] NOT desired in the job posting.

Additional keywords will further narrow the desired results.

The Pabang Webcrawler creates a PASS/FAIL summary based upon keywords, results, and desired match percentage.

Summary
  - Job Title, Search Criteria, Filter Criteria
  - Pass/Fail w/ Match Percentage
    * Pass: reasons based upon Search Criteria
    * Fail: reasons based upon Filter Criteria

### Functionality & MVP

With this application, users will be able to:

- [ ] Go to [keyword] URL specified by user
- [ ] Search job postings within URL w/ keywords specified by user
- [ ] Parse all job postings
- [ ] Display summary of keywords to job postings

### Technologies & Technical Challenges

This application will be implemented using the Selenium webdriver, JavaScript, to write the script, and Ruby, for user-friendly input/output.

Primary Technical Challenges:

- Teaching the script to grab specified HTML elements and inject user keywords
- Script customization based upon website design [Glassdoor, Hired, LinkedIn] including different website layout, possible user sign-in functionality, and daily modifications.
- Parsing the data and displaying accurately in real-time

### Implementation Timeline

# Day 1 - Day 2
 - Learn the basics of Selenium and become familiar with API. Learning how to utilize Git in a small group working on the same project. Goals for Days 1 and 2:
    * [ ] Learn the basics of Selenium
    * [ ] Learn effective Github workflow

# Day 3
 - Initial Pabang setup. Create necessary files including the basic skeleton of app. Goals for Days 3:
    * [ ] Write a basic terminal script asking for user input and writes and saves input into a separate text file for parsing
    * [ ] Allow users to input keywords for search criteria

# Day 4
 - Write logic to handle the actual web-crawling, search the specified sites for the user keywords, and saves each individual listing that matches the search criteria. Goals for Day 4:
    * [ ] Write logic for AI web-crawling
    * [ ] Create script logic to parse through websites, search for keywords, and save matches

# Day 5
 - Add styling and display info in a neat, organized manner. Goals for Day 5:
    * [ ] Clean/refactor code
    * [ ] Add styling
