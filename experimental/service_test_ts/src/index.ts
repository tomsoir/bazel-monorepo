// import express from 'express';

// const app = express();

// app.get('/health', (req, res) => {
//     res.status(200).send('helloworld');
// });

// const port = 3000;
// app.listen(port, () => {
//     console.log(`Server is running at http://localhost:${port}`);
// });

import func2 from "./index2.js";

function func1() {
    console.log(1);
    func2();
}

console.log(`Start!`);

func1();
