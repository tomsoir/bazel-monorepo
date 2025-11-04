import React from 'react';
import { createRoot } from 'react-dom/client';

const container = document.getElementById('root');
const root = container && createRoot(container);

root?.render(
  <React.StrictMode>
    <div>
      <h1>Hello, Webpack with TypeScript and React!</h1>
      <h2>service_test_ts_webpack_react</h2>
    </div>
  </React.StrictMode>
);
