# Pabang Webcrawler

### Background

Pabang is a web browser automation script for Glassdoor that utilizes the Selenium webdriver.

Created by Humza Baig, Jay Hwang, and Michael Pak.

### Instructions

Before beginning, please have Ruby 2.3.1. installed on your machine, and make sure you have an glassdoor account with a resume uploaded under the name 'resume'.

1. Download the project folder

2. On command line, navigate to the root directory of the project folder

3. type `bundle install` followed by `ruby sites/glassdoor.rb`

4. You might be prompted by glassdoor to complete a captcha when you first launch the program. You must complete the captcha, or the program will throw an error.

5. In the terminal, you will be prompted to enter your glassdoor login credentials so that the program can apply to jobs under your name.

6. Pabang will select the job listings you can apply through glassdoor, then apply for you. If it is the first time running the program, you will be prompted in the terminal for your application information. After the first application, your application info will be saved in a local file on your machine and you will not be prompted again. If you made a mistake and would like to change the info, simply navigate to the 'user_info/user_info.txt' text file and modify it to your liking. To change the cover letter, navigate to 'user_info/coverletter.txt' and modify it accordingly.

### Description

The user input keywords that trigger their corresponding action:

[Keyword] Search Criteria
- The script take keywords, including desired job position ex.[Software Engineer, Back-end, Front-end, Full Stack], and location ex.[San Francisco, CA] which is saved and injected into the website's search bar. The webcrawler then saves all relevant job postings within the website.

![questions](docs/questions.png)

[Index] Job Postings List
- The script parses through the results and stores relevant information related to the job posting ex. (Title of Job, Relevant Dates, Location). With the gathered information, the script will display a user-friendly list of all job postings that meet the search criteria.

![summary](docs/summary.png)

## In the Near Future

### Additional Bonus

Upcoming Websites
- Hired
- LinkedIn

Upcoming Features
- Job Posting Criteria Keywords
The script takes additional keywords [Ruby, Python, Leadership, Teamwork] desired in the job posting.

- Job Posting Filter Keywords
The script takes additional keywords [CEO, Vice-President, No-Salary] NOT desired in the job posting.

### Final Goal

The Pabang Webcrawler creates a PASS/FAIL summary based upon keywords, results, and desired match percentage.

Summary
  - Job Title, Search Criteria, Filter Criteria
  - Pass/Fail w/ Match Percentage
    * Pass: reasons based upon Search Criteria
    * Fail: reasons based upon Filter Criteria
