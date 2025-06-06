import express from 'express';

import func2 from './index2.js';

console.log('Express', express);

function func1() {
  console.log(1);
  func2();
}

console.log('Start!');

func1();
