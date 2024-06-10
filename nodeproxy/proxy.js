const express = require('express');
const request = require('request');
const helmet = require('helmet');
const rateLimit = require('express-rate-limit');
const app = express();

// Load environment variables from .env file
require('dotenv').config({ path: 'proxy.env' });

// Middleware for security headers
app.use(helmet());

// Rate limiting to prevent abuse
const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100, // limit each IP to 100 requests per windowMs
});
app.use(limiter);

// Middleware to add CORS headers to every response
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', process.env.ALLOWED_ORIGIN || '*');
  res.header('Access-Control-Allow-Methods', 'GET,HEAD,OPTIONS,POST,PUT');
  res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept, Authorization');
  // Handle preflight requests
  if (req.method === 'OPTIONS') {
    return res.status(200).end();
  }
  next();
});

app.use('/api', (req, res) => {
  const apiUrl = process.env.API_URL || 'http://154.38.171.253:8080/api';
  const url = apiUrl + req.url;
  console.log(`Forwarding request to: ${url}`);  // Log the forwarded URL for debugging
  req.pipe(request({ qs: req.query, uri: url }))
    .on('error', (err) => {
      res.status(500).send({ error: 'Proxy request failed' });
    })
    .pipe(res);
});

const port = process.env.PORT || 8081;
app.listen(port, () => {
  console.log(`Proxy server running on port ${port}`);
});
