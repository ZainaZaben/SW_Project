var mysql=require("mysql2");
var connection =mysql.createConnection({
    host:'localhost',
    database:'amitdb',
    user:'root',
    password:'Zanzoon2@'
});


connection.connect((err) => {
    if (err) {
      console.error('Error connecting to the database: ' + err.stack);
      return;
    }
    console.log('Connected to the database as id ' + connection.threadId);
  });


module.exports=connection;