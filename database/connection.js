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

// connection.getConnection((err, connection2) => {
//   if (err) {
//     console.error("Error connecting to MySQL: ", err);
//     return;
//   }

//   console.log("MySQL connection successful!");
// })


  // connection.getConnection((err, connection) => {
  //   if (err) {
  //     console.error("Error connecting to MySQL: ", err);
  //     return;
  //   }
  //   console.error(" connecting to MySQL success ", err);
  // });



module.exports = connection;
