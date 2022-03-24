const express = require("express");
const router = express.Router();

const { action } = require("./action.controller");

router.get("/", (req, res) => {
  res.json({ msg: "Subroute works" });
});

router.post("/:type", action);

module.exports = router;
