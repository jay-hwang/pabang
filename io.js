const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function test() {
  reader.question("Enter 1: ", function(answer1) {
    reader.question("Enter 2: ", function(answer2) {
      console.log(answer1, answer2);
    });
  });
}
