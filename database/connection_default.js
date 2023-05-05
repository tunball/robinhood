// get the client
const dotenv = require("dotenv");
dotenv.config();

const mysql = require('mysql2');

// create the connection to database
const connection2 = mysql.createConnection({
  host: process.env.HOST ,
  user: process.env.DB_USER ,
  password: process.env.DB_PASS,
  port: process.env.DB_PORT ,
  database: process.env.DB_DATABASE ,
});

connection2.connect(error => {
  if (error) {
    console.log(" database error " , error);
  }
  else{
    console.log("Successfully connected to the database.");
  }

});


module.exports = connection2;
