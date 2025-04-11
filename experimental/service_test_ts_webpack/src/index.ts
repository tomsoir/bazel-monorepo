import func2 from './index2.js';

function func1(): void {
  console.log(1);
  func2();
}

console.log(`Start!`);

func1();
