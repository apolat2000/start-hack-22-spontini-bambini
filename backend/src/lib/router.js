const express = require("express");
const router = express.Router();

const authRouter = require("./auth/auth.router");
const certificateRouter = require("./certificate/certificate.router");
const cvRouter = require("./cv/cv.router");
const analyticsRouter = require("./analytics/analytics.router");
const actionRouter = require("./action/action.router");

router.use("/auth", authRouter);
router.use("/certificate", certificateRouter);
router.use("/cv", cvRouter);
router.use("/analytics", analyticsRouter);
router.use("/action", actionRouter);

module.exports = router;
