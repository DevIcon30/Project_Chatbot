const mysql = require('mysql');

const db = mysql.createConnection({
  host: 'localhost',
  user: 'admin',
  password: 'updatedata',
  database: 'chatbot',
  port: "8889"
});

db.connect((err) => {
  if (err) {
    console.error('Error connecting to database:', err);
    return;
  }
  console.log('Connected to database');
});

module.exports = db;