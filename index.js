var express = require('express')
var cors = require('cors')
var app = express()
const mysql = require('mysql2');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'robinhood',
    port:3307
  });

app.use(cors())

app.get('/', (req, res) => {
    res.json({ message: 'API is running' })
  })

app.get('/jobs', function (req, res, next) {

    try {

        connection.query(
            `SELECT 
                jobs.id, jobs.title, jobs.status, 
                jobs.created_at, jobs.detail,
                Users.name, Users.email, Users.image
            FROM jobs 
                INNER JOIN Users 
            ON 
                jobs.created_by = Users.id      
            
            `,
            function(err, results, fields) {
                if(err){
                    console.log(err);
                }
                res.json(results);

            }

        );
        
    } catch (error) {
        console.log(" Error : " , error );
    }

      

})

app.get('/jobs/:id', function (req, res, next) {

    try {

        connection.query(
            `SELECT 
                jobs.id, jobs.title, jobs.status, 
                jobs.created_at, jobs.detail,
                Users.name, Users.email, Users.image
            FROM jobs 
                INNER JOIN Users 
            ON 
                jobs.created_by = Users.id      
            
            `,
            function(err, results, fields) {
                if(err){
                    console.log(err);
                }
                res.json(results);

            }

        );
        
    } catch (error) {
        console.log(" Error : " , error );
    }

      

})

app.get('/jobs/page/:page', function (req, res, next) {

    try {

        connection.query(
            `SELECT 
                jobs.id, jobs.title, jobs.status, 
                jobs.created_at, jobs.detail,
                Users.name, Users.email, Users.image
            FROM jobs 
                INNER JOIN Users 
            ON 
                jobs.created_by = Users.id      
            
            `,
            function(err, results, fields) {
                if(err){
                    console.log(err);
                }
                res.json(results);

            }

        );
        
    } catch (error) {
        console.log(" Error : " , error );
    }

      

})


app.post('/jobs/', function (req, res, next) {

    try {

        connection.query(
            `SELECT 
                jobs.id, jobs.title, jobs.status, 
                jobs.created_at, jobs.detail,
                Users.name, Users.email, Users.image
            FROM jobs 
                INNER JOIN Users 
            ON 
                jobs.created_by = Users.id      
            
            `,
            function(err, results, fields) {
                if(err){
                    console.log(err);
                }
                res.json(results);

            }

        );
        
    } catch (error) {
        console.log(" Error : " , error );
    }

      

})


app.listen(5000, function () {
   console.log('listening on port 5000')
})