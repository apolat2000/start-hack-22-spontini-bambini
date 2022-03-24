const {
  EVENT_TABLE,
  ORGANIZATION_TABLE,
  ORGANIZATION_TAGS_TABLE,
  USER_TABLE,
  UserDB,
  EventDB,
  OrganizationDB,
} = require("../general/general.models");

const database = require("../database");

const selectUserByEduId = ({ eduId }) =>
  database(USER_TABLE.name)
    .where({ [USER_TABLE.fields.eduId]: eduId })
    .first();

const insertUser = ({
  eduId,
  homeOrganizationId,
  firstName,
  lastName,
  email,
  mobilePhone,
}) =>
  database(USER_TABLE.name).insert(
    new UserDB({
      eduId,
      homeOrganizationId,
      firstName,
      lastName,
      email,
      mobilePhone,
    })
  );

module.exports = { selectUserByEduId, insertUser };
