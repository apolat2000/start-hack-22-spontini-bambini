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

const selectAllOrganizationsByUserId = async ({ userId }) =>
  database(EVENT_TABLE.name)
    .where({ [EVENT_TABLE.fields.issuerId]: userId })
    .distinctOn(EVENT_TABLE.fields.targetId)
    .rightJoin(
      ORGANIZATION_TABLE.name,
      `${EVENT_TABLE.name}.${EVENT_TABLE.fields.targetId}`,
      `${ORGANIZATION_TABLE.name}.${ORGANIZATION_TABLE.fields.id}`
    );

const selectLastEventByIssuerAndTarget = async ({ issuerId, targetId }) =>
  database(EVENT_TABLE.name)
    .where({
      [EVENT_TABLE.fields.issuerId]: issuerId,
      [EVENT_TABLE.fields.targetId]: targetId,
      [EVENT_TABLE.fields.timestamp]: (
        await database(EVENT_TABLE.name)
          .max(`${EVENT_TABLE.fields.timestamp} as max`)
          .where({
            [EVENT_TABLE.fields.issuerId]: issuerId,
            [EVENT_TABLE.fields.targetId]: targetId,
          })
          .first()
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

const insertEvent = async ({ issuerId, targetId, type, payload }) =>
  database(EVENT_TABLE.name).insert(
    new EventDB({ timestamp: Date.now(), issuerId, type, targetId, payload })
  );

const selectOrganizationById = ({ organizationId }) =>
  database(ORGANIZATION_TABLE.name)
    .where({
      [ORGANIZATION_TABLE.fields.id]: organizationId,
    })
    .first();

const selectAllTagsOfOrganization = ({ organizationId }) =>
  database(ORGANIZATION_TAGS_TABLE.name).where({
    [ORGANIZATION_TAGS_TABLE.fields.organizationId]: organizationId,
  });

module.exports = {
  selectEventById,
  selectLastEventByIssuerAndTarget,
  selectAllEventsByIssuerAndTarget,
  insertEvent,
  selectAllOrganizationsByUserId,
  selectOrganizationById,
};
