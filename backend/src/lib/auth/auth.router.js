const express = require("express");
const router = express.Router();

const { eduIdAction, completeProfileAction } = require("./auth.controller");

router.get("/", (req, res) => {
  res.json({ msg: "Subroute works" });
});

router.get("/after-edu-id-success", eduIdAction);
router.post("/complete-profile", completeProfileAction);

module.exports = router;
