# Dev with HTTPS

## install mkcert
```sh
# windows
choco install mkcert

# macos
brew install mkcert nss

# linux
sudo apt install libnss3-tools
wget https://dl.filippo.io/mkcert/latest?for=linux/amd64 -O mkcert
chmod +x mkcert
sudo mv mkcert /usr/local/bin/

```

## Create domain local Cert

```sh
mkcert -install
mkcert localhost 127.0.0.1 ::1

# RESULT:
# localhost.pem
# localhost-key.pem
```

## Setup server.js

```js
const fs = require('fs');
const https = require('https');
const express = require('express');

const app = express();

// Example middleware
app.get('/', (req, res) => {
  res.send('Hello HTTPS world!');
});

// Read mkcert certificates
const options = {
  key: fs.readFileSync('./localhost-key.pem'),
  cert: fs.readFileSync('./localhost.pem'),
};

const PORT = 9080;
// Create HTTPS server
https.createServer(options, app).listen(PORT, () => {
  console.log('✅ HTTPS Server running at https://localhost:PORT');
});
```

## Attention
```js
// setup for SESSSION
const session = require('express-session');
app.set('trust proxy', 1); // nếu chạy sau proxy (VD: nginx)
app.use(session({
  secret: 'your-secret',
  resave: false,
  saveUninitialized: true,
  cookie: {
    secure: true, // should be true for HTTPS
    sameSite: 'none',
  },
}));

// setup for CORS
const cors = require('cors');
app.use(cors({
  origin: 'https://localhost:5173', // FE domain
  credentials: true,
}));
```
 
