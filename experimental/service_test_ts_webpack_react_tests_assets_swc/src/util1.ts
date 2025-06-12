// import express from 'express';
// console.log(`Express`, express);
// # deps = [
//   #     ":node_modules/express",
//   #     ":node_modules/@types/express",
//   # ]

import func2 from './util2.js';

// debugger;

function func1(): number {
  console.log(1);
  return func2();
}

console.log('Start!');

export default func1;
