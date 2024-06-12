const PDFDocument = require('pdfkit');
const fs = require('fs');

let pdfDoc = new PDFDocument;
// pdfDoc.pipe(fs.createWriteStream('sampleDocument.pdf'));
pdfDoc.pipe(fs.createWriteStream('detailsArray.pdf'));
let myArrayOfItems = [{'Item':'abc', 'id': 1}, 'Item 2', 'Item 3', 'Item 4'];
let myArray = [{'name':'abc', 'id':1},{"name":"abc1", 'id':2},{"name":"abc3", 'id':3}]
// let convArray = [['name','abc', 'id',1],["name","abc1", 'id',2],["name","abc3", 'id',3]]
// var entries = Object.entries(convArray)
// var value = Object.values(myArray)
// // var key = Object.keys(myArray)

// pdfDoc.text("14",entries)
// pdfDoc.list(value)
// pdfDoc.list(myArrayOfItems)

// pdfDoc.text(myArray)
// const sampleArray = [  
//     {'one': 1},  
//     ['two', 2],  
//   ];  
    
// Object.fromEntries(sampleArray); 
// console.log(sampleArray); 
// const animal = {  
//     'first': 'The',  
//     'last': 'Lion'  
// };  
// const entriess=Object.entries(animal);  
// console.log(entriess); 
// pdfDoc.text("entris",entriess)
// pdfDoc.list("entris",entriess)
// pdfDoc.text("entris",sampleArray)
// pdfDoc.text(convArray)
// pdfDoc.list(convArray)


// const numbers = [
//     {'firstname': "Kundan"},
//     ['Lastname', "Sharma"]
// ];
  
//  const ks = Object.fromEntries(numbers);
//  console.log(Object.fromEntries(numbers));
//  console.log("--->",ks);
//  pdfDoc.text("--->",ks[0])
//   const objectArray = Object.entries(numbers);
  
//   objectArray.forEach(([key, value]) => {

//     console.log(key); // 'one'
//     console.log(value); // 1
//   });
//   pdfDoc.text(objectArray)
////////////////////////////////////////////////////////////////////----
//   var person = [];
//   person[0] = {
//     firstName: "John",
//     lastName: "Doe",
//     age: 60
//   };
  
  var i, item;
  
  for (i = 0; i < myArray.length; i++) {
    for (item in myArray[i]) {
      pdfDoc.text(item + ": " + myArray[i][item] );
    }
  }



pdfDoc.moveDown(0.5)
pdfDoc.text("Text Positioned at (200,200)",150,150);
pdfDoc
    .fillColor('red')
    .fontSize(17)
    .text("20%", 305,150);
pdfDoc.text("Very long text".repeat(20),{lineBreak:false});
pdfDoc.addPage();
pdfDoc.text("This text is keft aligned", {align: 'left'});
pdfDoc.text("This text is at the Center",{align: "center"});
pdfDoc.text("This text is keft aligned", {align: 'right'});
pdfDoc.text("This text needs to be slightly longer so that we can see that justification actually works as intended", {align: "justify"})
pdfDoc.text("This is a link",{underline: true})
pdfDoc.text("This text is italicized",{oblique:true});
pdfDoc.text("This text is striked-through",{strike:true});



pdfDoc.end();