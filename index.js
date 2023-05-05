const express = require('express');
const cors = require('cors');

const dotenv = require('dotenv');

const bodyParser = require('body-parser');
const jobsRouter = require('./gateway/jobs');

const conn2 = require("./database/connection_default");

const app = express();
dotenv.config();

app.use(bodyParser.json()); 
app.use(cors());

const port = Number(process.env.PORT || 5002);

app.get('/', (req, res) => {
  res.json({ message: 'API is running' });
});

app.get('/test-db', (req, res) => {


  conn2.query(
  ' SELECT * FROM jobs ',
  function(err, results, fields) {
  
   return res.json({ message: results });
  }
);


});


app.use('/jobs', jobsRouter);

app.listen(5000, () => {
    console.log(`🚀 Server running on port ${port}!`);
});
