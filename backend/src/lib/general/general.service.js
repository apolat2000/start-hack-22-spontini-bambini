const {
  EVENT_TABLE,
  ORGANIZATION_TABLE,
  USER_TABLE,
  UserDB,
  EventDB,
  OrganizationDB,
} = require("./general.models");

const database = require("../database");

const selectEventById = ({ eventId }) =>
  database(EVENT_TABLE.name)
    .where({ [EVENT_TABLE.fields.id]: eventId })
    .first();

const selectLastEventByIssuerAndTarget = async ({ issuerId, targetId }) =>
  database(EVENT_TABLE.name)
    .where({
      [EVENT_TABLE.fields.issuerId]: issuerId,
      [EVENT_TABLE.fields.targetId]: targetId,
      [EVENT_TABLE.fields.timestamp]: (
        await database(TABLE_EVENT.name)
          .max(`${TABLE_EVENT.fields.timestamp} as max`)
          .where({
            [EVENT_TABLE.fields.issuerId]: issuerId,
            [EVENT_TABLE.fields.targetId]: targetId,
          })
      ).max,
    })
    .first();

const selectAllEventsByIssuerAndTarget = async ({ issuerId, targetId }) =>
  database(EVENT_TABLE.name)
    .where({
      [EVENT_TABLE.fields.issuerId]: issuerId,
      [EVENT_TABLE.fields.targetId]: targetId,
    })
    .orderBy(EVENT_TABLE.fields.timestamp, "desc");

module.exports = {
  selectEventById,
  selectLastEventByIssuerAndTarget,
  selectAllEventsByIssuerAndTarget,
};
