import React from 'react';
import { createRoot } from 'react-dom/client';
import App from './App.js';
import util from './util1.js';

const container = document.getElementById('root');
const root = container && createRoot(container);

util();

root?.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
