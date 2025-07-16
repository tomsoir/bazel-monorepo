import express from 'express';

import hello from './utils.js';

const app = express();

const PORT = 3000;

app.get('/', (req, res) => {
  const text = hello() || 'OOPS BACKUP "HELLO WORLD"';
  res.send(text);
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
