const express = require('express');
const app = express();
const db = require('./database');
const qs = require('querystring');
const http = require('https');
const UltraMsg = require('ultramsg-whatsapp-api');
require('dotenv').config();

const instanceId = process.env.INSTANCE_ID;
const token = process.env.TOKEN;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(express.query());

app.get('/data', (req, res) => {
    console.log(`welcome to express.js`);
});

app.get('/database', (req, res) => {
    db.query('SELECT * FROM lh_chat', (err, rows) => {
      if (err) {
        console.error('Error querying database:', err);
        res.status(500).send('Error querying database');
      } else {
        res.json(rows);
      }
    });
  });

app.post('/send-message', (req, res) => {
    const recipient = req.body.recipient;
    const message = req.body.message;

    var options = {
        method: 'POST',
        hostname: 'api.ultramsg.com',
        port: null,
        path: `/instance${instanceId}/messages/chat`,
        headers: {
            'content-type': 'application/x-www-form-urlencoded'
        }
    };

    var postData = qs.stringify({
        'token': token,
        'to': recipient,
        'body': message
    });

    var apiReq = http.request(options, function (apiRes) {
        var chunks = [];

        apiRes.on('data', function (chunk) {
            chunks.push(chunk);
        });

        apiRes.on('end', function () {
            var body = Buffer.concat(chunks);
            console.log(body.toString());
            res.send(body.toString());
        });
    });

    apiReq.write(postData);
    apiReq.end();
});

// Start the server
const port = 3000;
app.listen(port, () => {
  console.log(`Server started on port ${port}`);
});