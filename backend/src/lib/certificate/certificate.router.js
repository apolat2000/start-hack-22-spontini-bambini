const express = require("express");
const router = express.Router();

const { generateCertificateAction } = require("./certificate.controller");

router.get("/", (req, res) => {
  res.json({ msg: "Subroute works" });
});

router.get("/generate", generateCertificateAction);

module.exports = router;
