import '@testing-library/jest-dom';
import 'jsdom';

/**
 * Everything below is for debugging only
 * It prints out the list of files in bazel-out directory
 */
import fs from 'fs';
import path from 'path';

function walk(dir: string, fileList: string[] = []): string[] {
  const files = fs.readdirSync(dir);
  for (const file of files) {
    const fullPath = path.join(dir, file);
    if (
      fs.statSync(fullPath).isDirectory() &&
      !fullPath.includes('node_modules/')
    ) {
      walk(fullPath, fileList);
    } else {
      fileList.push(fullPath);
    }
  }
  return fileList;
}

try {
  const files = walk('.');
  console.log('==== VITEST SETUP: File list ====');
  files.forEach((f) => console.log(f));
  console.log('==== END FILE LIST ====');
} catch (e) {
  console.error('Error walking files:', e);
}
