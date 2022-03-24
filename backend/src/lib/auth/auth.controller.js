// The logic here doesn't make sense and was developed this way due to time pressure.

const generalService = require("../general/general.service");
const authService = require("./auth.service");
const { DICTIONARY } = require("../general/general.models");

const {
  User,
  Event,
  Organization,
  UserDB,
  EventDB,
  OrganizationDB,
} = require("../general/general.models");

const eduIdAction = async (req, res) => {
  const eduId = req.body.edu_id;

  const userQuery = await authService.selectUserByEduId({ eduId });

  if (!userQuery) {
    res.json({ success: true, msg: "User not found." });
    return;
  }

  res.json({ success: true, msg: "User already exists." });
};

const completeProfileAction = async (req, res) => {
  const eduId = req.body.edu_id;
  const firstName = req.body.first_name;
  const lastName = req.body.last_name;
  const email = req.body.email;
  const mobilePhone = req.body.mobile_phone;
  const homeOrganizationId = req.body.home_organization_id;

  const userQuery = await authService.selectUserByEduId({ eduId });

  if (userQuery) {
    res.json({ success: true, msg: "User already exists." });
    return;
  }

  const userInsert = await authService.insertUser({
    eduId,
    homeOrganizationId,
    firstName,
    lastName,
    email,
    mobilePhone,
  });

  console.log({ userInsert });
  res.json({ success: true, msg: "User successfully registered." });
};

module.exports = { eduIdAction, completeProfileAction };
