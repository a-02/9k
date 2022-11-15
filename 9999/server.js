const express = require('express');

const app = express();
const port = 9999;

app.use(express.static('.'))

app.get('/', (req, res) => {
  res.sendFile('/home/nks/projects/9k/9999/index.html');
});

app.listen(port, () => {
  console.log('Listening on port 9999.')
});
