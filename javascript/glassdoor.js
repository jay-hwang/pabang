"use strict";

const webdriver = require('selenium-webdriver');
const browser = new webdriver.Builder().usingServer().withCapabilities({
  'browserName': 'chrome'
}).build();

function clickLink(link) {
  link.click();
}

function handleFailure(err) {
  console.error('Something went wrong\n', err.stack, '\n');
}

function closeBrowser() {
  browser.quit();
}

function findJobs() {
  // 'sc.keyword' is the name of search input field
  browser.findElement(webdriver.By.id('KeywordSearch')).sendKeys(
    'software engineer'
  );

  // 'LocationSearch' is the id of location input field
  let location = browser.findElement(webdriver.By.id('LocationSearch'));
  // clears input field of default values before sending keys
  location.clear();
  location.sendKeys(
    'San Francisco, CA'
  );

  // finds search button and clicks
  return browser.findElement(webdriver.By.className('search'));
}

function clickJobs() {
  // Targets only the job listings that allow you to apply through glassdoor.
  // 'applyText' is the class name of the green text that says 'Apply on Glassdoor'
  browser.findElements(webdriver.By.className("applyText")).then(elements => {
    for (let i = 0; i < elements.length; i++) {
      // Targets the first glassdoor application job listing.
      if (i === 0) {
        let element = elements[i];
        element.click().then(function() {
          // closes modal that pops up after clicking the first job listing
          browser.findElement(webdriver.By.className('mfp-close')).click()
          .then(() => {
            setTimeout(() => {
              // finds and clicks the 'apply' button
              let applyButton = browser.findElement(
                // Seems that glassdoor changes the name of their apply button
                // twice a day, switching from the href to class. Keep this
                // commented out, and we can switch them whenever the
                // attributes change
                webdriver.By.css('[href="#easy-apply-module"]')
                // webdriver.By.className('ezApplyBtn')
                // webdriver.By.className('applyButton')
              );

              // Sometimes, Selenium wouldn't be able to locate the
              // 'Apply on Glassdoor' button and would throw a
              // 'ElementNotVisibleError'. I suspected it had to do with
              // async requests. After hours, I found a solution that works:
              // The following code waits until applyButton is found, then
              // users the browser's methods and moves the mouse above the
              // applyButton element, then clicks it. It hasn't broken on
              // me yet, and if it does, Idk how to fix.
              applyButton.then(() => {
                browser.actions().mouseMove(applyButton).click().perform();
              });
            }, 5000);

          });
        });
      }
    }
  });
}

function apply() {
  // Fills out 'name' input field in application form
  browser.findElement(webdriver.By.id('ApplicantName')).sendKeys(
    'John Doe'
  );

  // Fills out 'email' input field in application form
  browser.findElement(webdriver.By.id('ApplicantEmail')).sendKeys(
    'john_doe@gmail.com'
  );

  // Fills out the optional 'message' field
  browser.findElement(webdriver.By.name('coverLetterHTML')).sendKeys(
    'This is my cover letter'
  );

}

browser.get('https://www.glassdoor.com/index.htm');
// Using setTimeout to prevent spamming requests to prevent the server
// from blocking the webcrawler. Ideally, clickJobs should be invoked
// after findJobs, but I ran into a few issues have yet to figure out
//
// Ideally, we would want something like this:
  // browser.wait(findJobs, 5000).then(clickJobs)
  // But this throws errors
// setTimeout(findJobs, 5000);
// setTimeout(clickJobs, 25000);
// setTimeout(apply, 35000);

setTimeout(() => (
  findJobs().click().then(() => (
    setTimeout(() => {
      clickJobs();
      setTimeout(apply, 10000);
    }, 5000)
  ))
), 5000);
