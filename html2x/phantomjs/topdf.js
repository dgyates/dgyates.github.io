var wpage = require('webpage').create(); 
var url = "https://donnels.github.io"; 
var output = "cv.pdf"; 

wpage.paperSize = { 
   width: '210mm', 
   height: '297mm', 
   
   margin: {
      'top':'5mm', 
      'left':'5mm', 
      'rigtht':'5mm', 
      'bottom':'5mm'
   }, 
   orientation:'portrait', 
   header: { 
      height: "1cm", 
      contents: phantom.callback(function(pageNumber, nPages) { 
         return "<h5>Header <b>" + pageNumber + " / " + nPages + "</b></h5>"; 
      }) 
   }, 
   footer: { 
      height: "1cm", 
      contents: phantom.callback(function(pageNumber, nPages) {   
         return "<h5>Footer <b>" + pageNumber + " / " + nPages + "</b></h5>"; 
      }) 
   } 
} 
wpage.open(url, function (status) { 
   if (status !== 'success') { 
      console.log('Page is not opening'); 
      phantom.exit(); 
   } else { 
      wpage.render(output); 
      phantom.exit();     
   } 
});
