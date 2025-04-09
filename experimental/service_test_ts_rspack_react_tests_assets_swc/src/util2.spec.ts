import { expect } from 'chai';
import { add } from './util2.js';

describe('add tests', function () {
  it('should execute sum on add', function () {
    const result = add(1, 1);
    expect(result).to.be.equal(2);
  });
});
