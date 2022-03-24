// ENV Configuration
require("dotenv").config();

// Load external packages
const http = require("http");
const express = require("express");
const cors = require("cors");
const compression = require("compression");
const helmet = require("helmet");
const bodyParser = require("body-parser");

// Load internal packages
const config = require("./config");
const router = require("./lib/router");

// Initialize express
const app = express();

// Setup helmet for application security
app.use(helmet());

// Setup CORS
app.use(cors(config.corsConfig));

// Setup compression for response bodies
app.use(compression());

// access to req.body
app.use(bodyParser.json());

// Setup demo index route
app.get("/", function (req, res) {
  res.json({
    status: "Its alive",
  });
});

// Setup API router => /api/v1
app.use("/api/v1", router);

// Start the server
const server = http.createServer(app);
server.listen(config.serverConfig.APP_PORT);
