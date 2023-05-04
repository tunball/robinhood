const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');

const bodyParser = require('body-parser');
const jobsRouter = require('./gateway/jobs');

const app = express();
dotenv.config();

app.use(bodyParser.json()); 
app.use(cors());

const port = Number(process.env.PORT || 5002);

app.get('/', (req, res) => {
  res.json({ message: 'API is running' });
});

app.get('/test', (req, res) => {
  res.json({ message: 'API is test' });
});

app.use('/jobs', jobsRouter);

app.listen(5000, () => {
    console.log(`🚀 Server running on port ${port}!`);
});
