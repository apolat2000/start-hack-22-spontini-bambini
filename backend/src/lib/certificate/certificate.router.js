const express = require("express");
const router = express.Router();

const {
  generateCertificateAction,
  listOrganizationsAction,
} = require("./certificate.controller");

router.get("/", (req, res) => {
  res.json({ msg: "Subroute works" });
});

router.get("/generate", generateCertificateAction);
router.get("/list-organizations", listOrganizationsAction);

module.exports = router;
