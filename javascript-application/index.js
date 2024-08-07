const express = require('express');
const bodyParser = require('body-parser');
const axios = require('axios');

// const OPA_AUTHZ_URL = 'http://127.0.0.1:8181/v1/data/httpapi/authz';
const OPA_AUTHZ_URL = 'http://127.0.0.1:8181/v1/data/authz';
const PORT = 3000;

const app = express();

const opaMiddleware = function (req, res, next) {
  const user = goToAuthServerAndGetUserDetails(req.headers.username);
  const input = {
    input: {
      roles: user.role,
      path: req.path,
      method: req.method,
    },
  };
  console.log({ input });

  try {
    // Make request to OPA
    const response = axios.post(OPA_AUTHZ_URL, input).then((res) => {
      const outputData = res.data;
      console.log({ outputData });

      if (outputData.result.allow) {
        next();
      } else {
        next(new Error('Unauthorized'));
      }
    });
  } catch (error) {
    next(new Error('Unauthorized'));
  }
};

const errorMiddleware = function (err, req, res, next) {
  if (res.headersSent) {
    return next(err);
  }

  console.error(err);
  res.status(401);
  res.send({ error: err.message });
};

app.use(
  bodyParser.urlencoded({
    extended: false,
  }),
  opaMiddleware,
  errorMiddleware,
);

app.get('/', (req, res) => {
  res.send('Hello, world!');
});

app.get('/admin', (req, res) => {
  res.send('ADMIN');
});

app.get('/health-check', (req, res) => {
  res.send('Healthy!');
});

app.listen(PORT, () => {
  console.log(`Now listening on http://localhost:${PORT}`);
});

const goToAuthServerAndGetUserDetails = function (user) {
  const output = {
    role: 'user',
  };

  if (user == 'ray') {
    output.role = ['admin'];
  } else if (user == 'admin') {
    output.role = ['admin', 'super-admin'];
  }

  return output;
  ƒ;
};
