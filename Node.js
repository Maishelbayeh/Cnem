const express = require('express');
const request = require('request');
const app = express();

// Middleware to add CORS headers to every response
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Methods', 'GET,HEAD,OPTIONS,POST,PUT');
  res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept, Authorization');
  // Handle preflight requests
  if (req.method === 'OPTIONS') {
    return res.status(200).end();
  }
  next();
});

app.use('/api', (req, res) => {
  const url = 'http://154.38.171.253:8080/api' + req.url;
  console.log(`Forwarding request to: ${url}`);  // Log the forwarded URL for debugging
  req.pipe(request({ qs: req.query, uri: url })).pipe(res);
});

app.listen(8081, () => {
  console.log('Proxy server running on port 8081');
});
