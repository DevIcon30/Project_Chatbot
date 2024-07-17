// const express = require('express');
// const bodyParser = require('body-parser');

// const app = express();
// const port = process.env.PORT || 3000;

// // Middleware
// app.use(bodyParser.json());

// // Endpoint webhook
// app.post('/webhook', (req, res) => {
//     const message = req.body;

//     // Proses pesan yang diterima di sini
//     console.log('Pesan diterima:', message);

//     // Kirim respon ke WhatsApp
//     res.status(200).send('Pesan diterima');
// });

// // Tambahkan rute GET untuk root
// app.get('/', (req, res) => {
//     res.send('Server berjalan dengan baik!');
// });

// app.listen(port, () => {
//     console.log(`Server berjalan di http://localhost:${port}`);
// });
const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('Hello, world!');
});

app.listen(3000, () => {
  console.log('Server is running on port 3000');
});
