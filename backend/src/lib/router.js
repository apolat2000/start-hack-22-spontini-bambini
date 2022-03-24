const express = require("express");
const router = express.Router();

// const eduIDRouter = require("./eduID/eduID.router");
const certificateRouter = require("./certificate/certificate.router");
const cvRouter = require("./cv/cv.router");
const analyticsRouter = require("./analytics/analytics.router");

// router.use("/edu-id", eduIDRouter);
router.use("/certificate", certificateRouter);
router.use("/cv", cvRouter);
router.use("/analytics", analyticsRouter);

module.exports = router;
