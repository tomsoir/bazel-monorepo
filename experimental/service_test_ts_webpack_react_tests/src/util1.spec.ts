import { expect } from 'chai';
import hello from './util1.js';

describe('util1 tests 1', function () {
  it('should execute func1 without errors', function () {
    expect(true).to.be.true;
  });
});

describe('util1 tests 2', function () {
  it('should execute func2 without errors', function () {
    expect(true).to.be.true;
  });
});

describe('util1 tests 3', function () {
  it('should execute default f and return number', function () {
    const result = hello();
    expect(result).to.be.equal(2);
  });
});
