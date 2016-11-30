const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.question("Which site? ", function(site) {
  reader.question("What jobs? ", function(job) {
    console.log(site, job);
    reader.close();
  });
});
