import cowsay from 'cowsay';
import file1JSON from './file1.json' assert { type: 'json' };
import file22JSON from './file22.json' assert { type: 'json' };

const cowWords = cowsay.say({
  text: "I'm a moooodule",
  e: 'oO',
  T: 'U '
});
console.log(cowWords);

console.log('files content 1', { file1JSON });
console.log('files content 22', { file22JSON });
