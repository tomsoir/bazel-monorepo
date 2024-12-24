// import express from 'express';
// console.log(`Express`, express);
// # deps = [
//   #     ":node_modules/express",
//   #     ":node_modules/@types/express",
//   # ]

import func2 from './index2.js';

function func1() {
  console.log(1);
  func2();
}

console.log(`Start!`);

func1();
