// get the client
const dotenv = require("dotenv");
const mysql = require("mysql2/promise");
dotenv.config();

const connection = mysql.createPool({
  host: process.env.HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  port: process.env.DB_PORT,
  database: process.env.DB_DATABASE,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

// connection.connect(function(err) {
//   if (err) throw err;
//   console.log('database connected!');
// });

module.exports = connection;
