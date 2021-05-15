const express = require('express')
const app = express();
const http = require('http')
const cors = require('cors')
app.use(cors());
app.use(express.json())
const bodyParser  = require('body-parser');
const { default: axios } = require('axios');
app.use(bodyParser.urlencoded({exteded: true}))
const mysql =  require('mysql');
const con = mysql.createPool({          
     host: 'localhost',
     port:'3306',     
     database: 'MIBD-PROYECTO',
     user: 'root',
     password: '123456'
});

app.get('/ofertas', function (req ,res){ 
     try{     
    // const movie_name = req.body.movieName;
     const query = "call verOfertasVenditor(trim('Gabi'));"; 
     //exec que          
     con.query(query,function (err, result) {
          if (err) throw err;     
          res.status(300).json(result);         
     });     

     }catch(error){
          console.log(error);
     }
});


app.get('/MejoresVenditors', function (req ,res){ 
     try{     
          // se usa esta vista    
     const query = "select Userid,Name,productCategoryId,Category,SoldAmount from mejoresVenditors"; 
     //exec que          
     con.query(query,function (err, result) {
          if (err) throw err;     
          res.status(300).json(result);         
     });     

     }catch(error){
          console.log(error);
     }
});
app.listen(3002, () =>{
     console.log('srvr on port 3002');
})