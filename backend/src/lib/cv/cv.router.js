const express = require("express");
const router = express.Router();

router.get("/", (req, res) => {
  res.json({ msg: "Subroute works" });
});

module.exports = router;
