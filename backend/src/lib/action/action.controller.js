const generalService = require("../general/general.service");

const {
  User,
  Event,
  Organization,
  UserDB,
  EventDB,
  OrganizationDB,
  DICTIONARY,
} = require("../general/general.models");

const action = async (req, res) => {
  const issuerId = req.body.user_id;
  const targetId = req.body.organization_id;
  const payload = req.body.payload;
  const type = req.params.type;

  const query = await generalService.selectLastEventByIssuerAndTarget({
    issuerId,
    targetId,
  });

  if (!query && type !== DICTIONARY.eventTypes.join) {
    res.json({
      success: false,
      msg: "The user must join first.",
    });
    return;
  }

  if (query) {
    const lastEvent = new Event(query);

    if (
      type === DICTIONARY.eventTypes.join &&
      lastEvent.type !== DICTIONARY.eventTypes.leave
    ) {
      res.json({
        success: false,
        msg: "Already joined.",
      });
      return;
    }

    if (lastEvent.type === type && lastEvent.payload === payload) {
      res.json({
        success: false,
        msg: "This is the same as the last event. Not allowed.",
      });
      return;
    }

    if (
      lastEvent.type === DICTIONARY.eventTypes.stopSuspend &&
      type !== DICTIONARY.eventTypes.startSuspend
    ) {
      res.json({
        success: false,
        msg: "Cannot stop suspend without starting it.",
      });
      return;
    }
  }

  const insertEventRes = await generalService.insertEvent({
    issuerId,
    targetId,
    type,
    payload,
  });

  res.json({ success: true, msg: "ok" });
};

module.exports = { action };
