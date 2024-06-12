const express = require("express");
const multer = require("multer");
const app = express()
const mysql = require('mysql'),
xlsx = require("xlsx");
// const connectDB = require("./config/db");
// const Lead = require("./models/Lead");

// connectDB();
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

const uploadXLSX = async (req, res, next) => {
  try {
    let path = req.file.path;
    var workbook = XLSX.readFile(path);
    var sheet_name_list = workbook.SheetNames;
    let jsonData = XLSX.utils.sheet_to_json(
      workbook.Sheets[sheet_name_list[0]]
    );
    if (jsonData.length === 0) {
      return res.status(400).json({
        success: false,
        message: "xml sheet has no data",
      });
    }
    let savedData = await Lead.create(jsonData);

    return res.status(201).json({
      success: true,
      message: savedData.length + " rows added to the database",
    });
  } catch (err) {
    return res.status(500).json({ success: false, message: err.message });
  }
};

var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "uploads");
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + "-" + file.originalname);
  },
});

const upload = multer({ storage: storage });

app.post("/upload", upload.single("xlsx"), uploadXLSX);

const port = process.env.PORT || 5000;

const server = app.listen(port, () => {
  console.log("app running on port", port);
});