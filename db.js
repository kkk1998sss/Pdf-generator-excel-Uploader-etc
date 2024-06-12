const express = require('express')
const app = express()
var createError = require('http-errors');
const bodyparser = require('body-parser')
const fs = require('fs');
const readXlsxFile = require('read-excel-file/node');
const mysql = require('mysql'),
xlsx = require("xlsx");
const multer = require('multer')
const path = require('path')
const excel = require("exceljs");
const http = require('http');
var Json2csvParser = require('json2csv').Parser;
//use express static folder
app.use(express.static("./public"))
// const exceldata = db.;
// body-parser middleware use
app.use(bodyparser.json())
app.use(bodyparser.urlencoded({
extended: true
}))
// Database connection
const db = mysql.createConnection({
    connectionLimit : 10,
    host            : 'localhost',
    user            : 'oll_database',
    password        : 'sharma227@',
    database        : 'oll_database'
})
db.connect(function (err) {
    if (err) {
    return console.error('error: ' + err.message);
    }
    console.log('Connected to the MySQL server.');
})
// Multer Upload Storage
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        try{
            cb(null,"uploads")
        }catch(e){
            cb(e);
        }
    },
    filename: (req, file, cb) => {
        cb(null, file.fieldname + "-" + Date.now() + "-" + file.originalname)
    }
});
const upload = multer({storage: storage});
//! Routes start
//route for Home page
app.get('/', (req, res) => {
    res.sendFile(__dirname + '/index.html');
});

// -> Express Upload RestAPIs
app.post('/uploadfile', upload.single("uploadfile"), (req, res) =>{
    importExcelData2MySQL(__dirname + '/uploads/' + req.file.filename);
    console.log(importExcelData2MySQL(__dirname + '/uploads/' + req.file.filename));
});

//  Upload Excel File --------------------------------------------------------------------->
// -> Import Excel Data to MySQL database
function importExcelData2MySQL(filePath){
    
    var workbook = xlsx.readFile(filePath),
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
            console.log("USER ID:" + results.insertId);
        });
    }
}
// Download CSV File Format--------------------------------------------------------------------------------->
app.get('/CSV_download',function(req,res){
    db.query("SELECT * FROM cor_beat_m", function (err, users, fields) {
      if (err) throw err;
      console.log("users:");
       
      const jsonUsers = JSON.parse(JSON.stringify(users));
      console.log(jsonUsers);
   
      // -> Convert JSON to CSV data
      const csvFields = ['beat_id', 'zone_id', 'beat_name'];
      const json2csvParser = new Json2csvParser({ csvFields });
      const csv = json2csvParser.parse(jsonUsers);
   
      console.log(csv);
   
       res.setHeader("Content-Type", "text/csv");
       res.setHeader("Content-Disposition", "attachment; filename=users.csv");
   
       res.status(200).end(csv);
      // -> Check 'customer.csv' file in root project folder
    });
  });


//Download Through Excel Format------------------------------------------------------------------------------>
  // (C) EXPORT TO EXCEL
  app.get('/excel_download',function(req,res){
    var sql="SELECT * FROM cor_beat_m";
    db.query(sql, (error, results) => {
        console.log(results);
        // (C1) EXTRACT DATA FROM DATABASE
        if (error) throw error;
        var data = [["beat_id","zone_id","beat_name","beat_assigning_form_id","segment_name","approved","division_id","city_id","division",
        "state_id","status","enter_by","enter_date","modify_by","modify_date","deleted_at"]];
        results.forEach(row => {
        data.push([
            row["beat_id"], 
            row["zone_id"],
            row["beat_name"],
            row["beat_assigning_form_id"],
            row["segment_name"],
            row["approved"],
            row["division_id"],
            row["city_id"],
            row["division"],
            row["state_id"],
            row["status"],
            row["enter_by"],
            row["enter_date"],
            row["modify_by"],
            row["modify_date"],
            row["deleted_at"],
        ]);
        });
        // (C2) WRITE TO EXCEL FILE
        var worksheet = xlsx.utils.aoa_to_sheet(data),
            workbook = xlsx.utils.book_new();
        xlsx.utils.book_append_sheet(workbook, worksheet, "Users");
        res.setHeader(
            "Content-Type",
            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
            );
        res.setHeader(
            "Content-Disposition", 
            `attachment; filename = Users.xlsx`
            );
        xlsx.writeFile(workbook, "Users.xlsx"); 
    });
});

// Create a Server
let server = app.listen(8080, function () {
    let host = server.address().address
    let port = server.address().port
    console.log(`App listening at http:`,port) 
})