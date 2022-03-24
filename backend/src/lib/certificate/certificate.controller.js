const certificateService = require("./certificate.service");
const generalService = require("../general/general.service");

const {
  User,
  Event,
  Organization,
  UserDB,
  EventDB,
  OrganizationDB,
} = require("../general/general.models");

const generateCertificateAction = async (req, res) => {
  const userId = req.body.user_id;
  const organizationId = req.body.organization_id;

  const allEvents = await generalService
    .selectAllEventsByIssuerAndTarget({
      issuerId: userId,
      targetId: organizationId,
    })
    .map((e) => new Event(e));

  console.log({ allEvents });

  // TODO: here comes the business logic. What exactly are we going to consider?
};

module.exports = { generateCertificateAction };
