

// var express = require('express');
// var app = express();

// app.get('/', function (req, res) {
   
//     var mysql      = require('mysql');
//     var connection = mysql.createConnection({
//     host     : 'localhost',
//     user     : 'me',
//     password : 'secret',
//     database : 'my_db'
//     });
 
//     connection.connect();

//     // connect to your database
//     sql.connect(config, function (err) {
    
//         if (err) console.log(err);

//         // create Request object
//         var request = new sql.Request();
            
//         // query to the database and get the records
//         request.query('select * from Student', function (err, recordset) {
            
//             if (err) console.log(err)

//             // send records as a response
//             res.send(recordset);
            
//         });
//     });
// });

// var server = app.listen(5000, function () {
//     console.log('Server is running..');
// });

const express = require('express')
const app = express()
const mysql = require("mysql"),
  xlsx = require("xlsx");
const bodyParser = require('body-parser')

const port = process.env.PORT || 5000;

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

// MySQL
const db = mysql.createConnection({
    host            : 'localhost',
    user            : 'oll_database',
    password        : 'sharma227@',
    database        : 'oll_database'
});
   
// Get all cor_beat_m
app.get('/upload', (req, res) => {
    db.connect((err, connection) => {
        var workbook = xlsx.readFile("cor_beat_m.xlsx"),
  worksheet = workbook.Sheets[workbook.SheetNames[0]],
  range = xlsx.utils.decode_range(worksheet["!ref"]);

// (D) IMPORT EXCEL
for (let row = range.s.r; row <= range.e.r; row++) {
  // (D1) READ CELLS
  let data = [];
  for (let col = range.s.c; col <= range.e.c; col++) {
    let cell = worksheet[xlsx.utils.encode_cell({ r: row, c: col })];
    data.push(cell.v);
  }
console.log(data);
  // (D2) INSERT INTO DATABASE
  let sql = "INSERT INTO `cor_beat_m` (`beat_id`, `zone_id`, `beat_name`, `beat_assigning_form_id`, `segment_name`, `approved`, `division_id`, `city_id`, `state_id`, `division`, `status`, `enter_by`, `enter_date`, `modify_by`, `modify_date`, `deleted_at`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
  db.query(sql, data, (err, results, fields) => {
    if (err) {
      return console.error(err.message);
    }
    // console.log("USER ID:" + results.insertId);
  });
}
    })
})

// Get an beer
// app.get('/:id', (req, res) => {
//     pool.getConnection((err, connection) => {
//         if(err) throw err
//         connection.query('SELECT * FROM cor_beat_m WHERE id = ?', [req.params.id], (err, rows) => {
//             connection.release() // return the connection to pool
//             if (!err) {
//                 res.send(rows)
//             } else {
//                 console.log(err)
//             }
            
//             console.log('The data from beer table are: \n', rows)
//         })
//     })
// });

// // Delete a beer
// app.delete('/:id', (req, res) => {

//     pool.getConnection((err, connection) => {
//         if(err) throw err
//         connection.query('DELETE FROM cor_beat_m WHERE id = ?', [req.params.id], (err, rows) => {
//             connection.release() // return the connection to pool
//             if (!err) {
//                 res.send(`Beer with the record ID ${[req.params.id]} has been removed.`)
//             } else {
//                 console.log(err)
//             }
            
//             console.log('The data from beer table are: \n', rows)
//         })
//     })
// });

// // Add beer
// app.post('', (req, res) => {

//     pool.getConnection((err, connection) => {
//         if(err) throw err
        
//         const params = req.body
//         connection.query('INSERT INTO cor_beat_m SET ?', params, (err, rows) => {
//         connection.release() // return the connection to pool
//         if (!err) {
//             res.send(`Beer with the record ID  has been added.`)
//         } else {
//             console.log(err)
//         }
        
//         console.log('The data from beer table are:11 \n', rows)

//         })
//     })
// });


// app.put('', (req, res) => {

//     pool.getConnection((err, connection) => {
//         if(err) throw err
//         console.log(`connected as id ${connection.threadId}`)

//         const { id, name, tagline, description, image } = req.body

//         connection.query('UPDATE cor_beat_m SET name = ?, tagline = ?, description = ?, image = ? WHERE id = ?', [name, tagline, description, image, id] , (err, rows) => {
//             connection.release() // return the connection to pool

//             if(!err) {
//                 res.send(`Beer with the name: ${name} has been added.`)
//             } else {
//                 console.log(err)
//             }

//         })

//         console.log(req.body)
//     })
// })


// Listen on enviroment port or 5000
app.listen(port, () => console.log(`Listening on port ${port}`))