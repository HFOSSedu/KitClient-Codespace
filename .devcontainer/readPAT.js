const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stderr
});

rl.query = "Paste PAT here: ";
rl.stdoutMuted = true;

rl._writeToOutput = function _writeToOutput(stringToWrite) {
  if (rl.stdoutMuted)
    rl.output.write("\x1B[2K\x1B[200D" + rl.query + "*".repeat(rl.line.length));
  else
    rl.output.write(stringToWrite);
};

rl.question(rl.query, function(password) {
  console.log(password);
  rl.close();
});

rl.on('close', function() {
  console.error('');
  process.exit(0);
});