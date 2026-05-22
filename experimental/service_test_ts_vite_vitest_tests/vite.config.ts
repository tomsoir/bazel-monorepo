/// <reference types="vitest" />

import react from '@vitejs/plugin-react-swc';
import { defineConfig } from 'vitest/config';
import { PluginOption } from 'vite';

type CoverageReporter = [
  'text',
  ['lcov', { file: string; projectRoot: string }]
];

function bazelCoverageConfig() {
  const runfiles = process.env.RUNFILES || process.env.JS_BINARY__RUNFILES;

  return {
    enabled: true,
    provider: 'v8' as const,
    reporter: [
      'text',
      ['lcov', { file: 'coverage.dat', projectRoot: runfiles }]
    ] as CoverageReporter,
    include: ['src/**/*.{ts,tsx,js,jsx}'],
    exclude: [
      '**/*.{spec,test}.{ts,tsx,js,jsx}',
      '**/vitest-setup.ts',
      '**/test-utils.tsx'
    ]
  };
}

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react() as PluginOption],
  root: '.',
  build: {
    rollupOptions: {
      input: './src/index.html'
    },
    outDir: 'dist'
  },
  test: {
    globals: true,
    environment: 'jsdom',
    setupFiles: './src/vitest-setup.ts',
    coverage: bazelCoverageConfig()
  }
});
