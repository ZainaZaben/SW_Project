const connection = require('./database'); // Import your database connection
var bodyParser=require('body-parser');
var urlencoderParser=bodyParser.urlencoded({extended:false});


function handleaddFeedback(req, res) {
    console.log('********* Request body:', req.body);
    const {
    registerId,
    feedbacknumber,
    feedbackcomment,
    } = req.body;
    const parsedregisterId = parseInt(registerId, 10);
    const parsedfeedbacknumber=parseInt(feedbacknumber,10);
    const insertUserQuery = 'INSERT INTO feedback (registerId,feedbacknumber,feedbackcomment ) VALUES (?, ?, ?)';
    connection.query(
      insertUserQuery,
      [parsedregisterId, parsedfeedbacknumber,feedbackcomment],
      (err, result) => {
        if (err) {
          console.error(err);
          res.status(500).send('Error inserting data into the database: ' + err.message);
        } else {
          res.status(200).send('feedback successful');
        }
      }
    );
  }
  
  module.exports = { handleaddFeedback };