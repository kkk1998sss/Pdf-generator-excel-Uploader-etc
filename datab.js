//JavaScript
const express = require('express')
const app = express()
const mysql = require("mysql"),
  xlsx = require("xlsx");
 
// (B) CONNECT TO DATABASE - CHANGE SETTINGS TO YOUR OWN!
const db = mysql.createConnection({
    host            : 'localhost',
    user            : 'oll_database',
    password        : 'sharma227@',
    database        : 'oll_database'
});

app.post('/import-excel', uploadFile.single('xlsx'), (req, res) => {
  importFileToDb(__dirname + '/uploads/' + req.file.filename)
  console.log(res)
})
app.get('/', (req, res)=>{
 
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
    console.log("USER ID:" + results.insertId);
  });
}
   
  res.render('home', {data:data});
});

// // (C) OPEN EXCEL FILE - USE FIRST WORKSHEET
// var workbook = xlsx.readFile("cor_beat_m.xlsx"),
//   worksheet = workbook.Sheets[workbook.SheetNames[0]],
//   range = xlsx.utils.decode_range(worksheet["!ref"]);

// // (D) IMPORT EXCEL
// for (let row = range.s.r; row <= range.e.r; row++) {
//   // (D1) READ CELLS
//   let data = [];
//   for (let col = range.s.c; col <= range.e.c; col++) {
//     let cell = worksheet[xlsx.utils.encode_cell({ r: row, c: col })];
//     data.push(cell.v);
//   }
// console.log(data);
//   // (D2) INSERT INTO DATABASE
//   let sql = "INSERT INTO `cor_beat_m` (`beat_id`, `zone_id`, `beat_name`, `beat_assigning_form_id`, `segment_name`, `approved`, `division_id`, `city_id`, `state_id`, `division`, `status`, `enter_by`, `enter_date`, `modify_by`, `modify_date`, `deleted_at`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
//   db.query(sql, data, (err, results, fields) => {
//     if (err) {
//       return console.error(err.message);
//     }
//     // console.log("USER ID:" + results.insertId);
//   });
// }

// (E) DONE - CLOSE DB CONNECTION
const port = process.env.PORT || 5000;

const server = app.listen(port, () => {
  console.log("app running on port", port);
});

//JavaScript
// const express = require('express')
// const app = express()
// const bodyparser = require('body-parser')
// const fs = require('fs');
// const readXlsxFile = require('read-excel-file/node');
// const mysql = require('mysql'),
// xlsx = require("xlsx");
// const multer = require('multer')
// const path = require('path')
 
// // (B) CONNECT TO DATABASE - CHANGE SETTINGS TO YOUR OWN!
// const db = mysql.createConnection({
//     host            : 'localhost',
//     user            : 'oll_database',
//     password        : 'sharma227@',
//     database        : 'oll_database'
// });

// const uploadXLSX = async (req, res, next) => {
//     try {
//       let path = req.file.path;
//     //   var workbook = xlsx.readFile("cor_beat_m.xlsx"),
//     //   worksheet = workbook.Sheets[workbook.SheetNames[0]],
//     //   range = xlsx.utils.decode_range(worksheet["!ref"]);
//       var workbook = XLSX.readFile(path);
//       var sheet_name_list = workbook.SheetNames;
//       let jsonData = XLSX.utils.sheet_to_json(
//         workbook.Sheets[sheet_name_list[0]]
//       );
//       if (jsonData.length === 0) {
//         return res.status(400).json({
//           success: false,
//           message: "xml sheet has no data",
//         });
//       }
//       let savedData = await Lead.create(jsonData);
//       for (let row = range.s.r; row <= range.e.r; row++) {
//         // (D1) READ CELLS
//         let data = [];
//         for (let col = range.s.c; col <= range.e.c; col++) {
//           let cell = worksheet[xlsx.utils.encode_cell({ r: row, c: col })];
//           data.push(cell.v);
//         }
//       console.log(data);
//         // (D2) INSERT INTO DATABASE
//         let sql = "INSERT INTO `cor_beat_m` (`beat_id`, `zone_id`, `beat_name`, `beat_assigning_form_id`, `segment_name`, `approved`, `division_id`, `city_id`, `state_id`, `division`, `status`, `enter_by`, `enter_date`, `modify_by`, `modify_date`, `deleted_at`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
//         db.query(sql, data, (err, results, fields) => {
//           if (err) {
//             return console.error(err.message);
//           }
//           // console.log("USER ID:" + results.insertId);
//         });
//       }
  
//       return res.status(201).json({
//         success: true,
//         message: savedData.length + " rows added to the database",
//       });
//     } catch (err) {
//       return res.status(500).json({ success: false, message: err.message });
//     }
//   };

// // var workbook = xlsx.readFile("xlsx"),
// //   worksheet = workbook.Sheets[workbook.SheetNames[0]],
// //   range = xlsx.utils.decode_range(worksheet["!ref"]);

// // (D) IMPORT EXCEL
// var storage = multer.diskStorage({
//     destination: function (req, file, cb) {
//       cb(null, "uploads");
//     },
//     filename: function (req, file, cb) {
//       cb(null, Date.now() + "-" + file.originalname);
//     },
//   });
  

// const upload = multer({ storage: storage });

// app.post("/upload", upload.single("xlsx"), uploadXLSX);
// // (E) DONE - CLOSE DB CONNECTION
// const port = process.env.PORT || 5000;

// const server = app.listen(port, () => {
//   console.log("app running on port", port);
// });