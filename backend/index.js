var express=require("express");
var app=express();
var connection=require('./database');
var bodyParser=require('body-parser');
const session = require('express-session');
var urlencoderParser=bodyParser.urlencoded({extended:false});
const signupController = require('./signupController');
const loginController = require('./loginController'); 

require('dotenv').config(); // Load the .env file
const sessionSecret = process.env.SESSION_SECRET;

app.set('view engine','ejs');
//app.use('assets',express.static('stuff'));
app.use(
  session({
    secret: sessionSecret,
    resave: false,
    saveUninitialized: true,
  })
);


app.get('/students',function(req,res){
    let sql="SELECT * FROM STUDENTS";
    connection.query(sql,function(err, results){
        if(err) throw err;
        res.send(results);
    })
});
 
app.get('/category',function(req,res){
  let sql="SELECT CategoryName,Icon FROM category";
  connection.query(sql,function(err, results){
      if(err) throw err;
      res.send(results);
  })
});
app.get('/furniturepage',function(req,res){
  let sql="SELECT iditem,title,image,CategoryName FROM item i,category c where c.idCategory=i.idCategory and i.idCategory=4";
  connection.query(sql,function(err, results){
      if(err) throw err;
      res.send(results);
  })
});
app.get('/electronicpage',function(req,res){
  let sql="SELECT iditem,title,image,CategoryName FROM item i,category c where c.idCategory=i.idCategory and i.idCategory=3";
  connection.query(sql,function(err, results){
      if(err) throw err;
      res.send(results);
  })
});
app.get('/furniturdetails', function (req, res) {
  let sql = "SELECT i.iditem, i.image, i.title, c.CategoryName, i.date, i.status, i.price, i.description, s.Fname, s.Lname FROM gp_sw.item i, gp_sw.category c, gp_sw.students s where c.idCategory = i.idCategory and s.registerID = i.registerID;";
  connection.query(sql, function (err, results) {
    if (err) throw err;

    // Convert the price to a string
    results.forEach(item => {
      item.price = item.price.toString();
      
      // Convert the date to a string with the year, month, and day
      item.date = new Date(item.date).toLocaleDateString('en-US', {
        year: 'numeric',
        month: '2-digit',
        day: '2-digit'
      });
    });

    res.send(results);
  });
});

app.get('/electronicdetails', function (req, res) {
  let sql = "SELECT i.iditem, i.image, i.title, c.CategoryName, i.date, i.status, i.price, i.description, s.Fname, s.Lname FROM gp_sw.item i, gp_sw.category c, gp_sw.students s where c.idCategory = i.idCategory and s.registerID = i.registerID ";
  connection.query(sql, function (err, results) {
    if (err) throw err;

    // Convert the price to a string
    results.forEach(item => {
      item.price = item.price.toString();
      
      // Convert the date to a string with the year, month, and day
      item.date = new Date(item.date).toLocaleDateString('en-US', {
        year: 'numeric',
        month: '2-digit',
        day: '2-digit'
      });
    });

    res.send(results);
  });
});




app.post('/signup',urlencoderParser, signupController.handleSignup);
app.post('/login', urlencoderParser, loginController.handleLogin);


const nodemailer = require('nodemailer');

const transporter = nodemailer.createTransport({
    service: 'Gmail', // Use the email service provider you prefer
    auth: {
        user: 'raghadsalameh926@gmail.com', // Your email address
        pass: 'Raghad2001*', // Your email password or an app password
    },
});
 
function generateVerificationCode() {
  return Math.floor(1000 + Math.random() * 9000);
}
app.post('/sendVerificationCode', urlencoderParser,(req, res) => {
  const { email } = req.body;
  console.log('********* Request body:', req.body);
  const verificationCode = generateVerificationCode();

  // Save the verification code and email association in your database
  const insertUserQuery = 'UPDATE STUDENTS SET code = ? WHERE registerID = ?';
    connection.query(
      insertUserQuery,
      [verificationCode,11924399],
      (err, result) => {
        if (err) {
          console.error(err);
          res.status(500).send('Error inserting data into the database: ' + err.message);
        } else {
          res.status(200).send('Signup successful');
        }
      });
  const mailOptions = {
      from: 'raghadsalameh926@gmail.com',
      to: email, // The recipient's email
      subject: 'Verification Code',
      text: `Your verification code is: ${verificationCode}`,
  };

  transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
          console.error('Email sending error:', error);
          res.status(500).json({ message: 'Failed to send verification code email' });
      } else {
          console.log('Email sent: ' + info.response);
          res.status(200).json({ message: 'Verification code sent successfully' });
      }
  });
});

app.post('/verifyCode',urlencoderParser, (req, res) => {
  const { email, verificationCode  } = req.body;

  // Retrieve the stored code associated with the email and compare it
  const selectCodeQuery = 'SELECT code FROM STUDENTS WHERE registerID = ?';
  connection.query(selectCodeQuery, 11924399, (err, results) => {
    if (err) {
      console.error(err);
      res.status(500).send('Error querying the database');
    } else {
      if (results.length > 0) {
        const storedCode = results[0].code;

        if (verificationCode === storedCode) {
          res.status(200).send('Verification successful');
        } else {
          res.status(401).send('Incorrect verification code');
        }
      } else {
        res.status(404).send('User not found');
      }
    }
  });
});
  

app.post('/resetPassword',urlencoderParser, (req, res) => {
  const { email, newPassword } = req.body;

  // Update the user's password in your database

  res.status(200).json({ message: 'Password reset successful' });
});
  
//start server:  
app.listen(3000,function(){
    console.log('App Listening on port 3000');
    connection.connect(function(err){
        if(err) throw err;
        console.log('Database connected!');
    })

});