const {
  EVENT_TABLE,
  USER_TABLE,
  ORGANIZATION_TABLE,
  ORGANIZATION_TAGS_TABLE,
  TAG_TABLE,
  DICTIONARY,
} = require("../lib/general/general.models");

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = async function (knex) {
  await knex.schema.raw('CREATE EXTENSION IF NOT EXISTS "uuid-ossp"');
  return knex.schema
    .createTable(USER_TABLE.name, function (table) {
      table
        .uuid(USER_TABLE.fields.id)
        .primary()
        .defaultTo(knex.raw("uuid_generate_v4()"));

      table
        .uuid(USER_TABLE.fields.homeOrganization)
        .defaultTo(knex.raw("uuid_generate_v4()"));

      table
        .uuid(USER_TABLE.fields.eduId)
        .defaultTo(knex.raw("uuid_generate_v4()"));

      table.string(USER_TABLE.fields.firstName).notNullable();
      table.string(USER_TABLE.fields.lastName).notNullable();
      table.string(USER_TABLE.fields.email).notNullable();
      table.string(USER_TABLE.fields.mobilePhone).notNullable();
    })
    .createTable(ORGANIZATION_TABLE.name, function (table) {
      table
        .uuid(ORGANIZATION_TABLE.fields.id)
        .primary()
        .defaultTo(knex.raw("uuid_generate_v4()"));
      table.string(ORGANIZATION_TABLE.fields.name).notNullable();
      table.string(ORGANIZATION_TABLE.fields.postalAddress).notNullable();

      table
        .enu(ORGANIZATION_TABLE.fields.type, [
          DICTIONARY.organizationTypes.npo,
          DICTIONARY.organizationTypes.universitySpinOff,
          DICTIONARY.organizationTypes.university,
        ])
        .notNullable();
    })
    .createTable(TAG_TABLE.name, function (table) {
      table.string(TAG_TABLE.fields.name).notNullable().primary();
    })
    .createTable(EVENT_TABLE.name, function (table) {
      table
        .uuid(EVENT_TABLE.fields.id)
        .primary()
        .defaultTo(knex.raw("uuid_generate_v4()"));
      table.bigInteger(EVENT_TABLE.fields.timestamp).unsigned();
      table
        .enu(EVENT_TABLE.fields.type, [
          DICTIONARY.eventTypes.join,
          DICTIONARY.eventTypes.leave,
          DICTIONARY.eventTypes.newRole,
          DICTIONARY.eventTypes.startSuspend,
          DICTIONARY.eventTypes.stopSuspend,
        ])
        .notNullable();
      table
        .uuid(EVENT_TABLE.fields.issuerId)
        .notNullable()
        .references(USER_TABLE.fields.id)
        .inTable(USER_TABLE.name);

      table
        .uuid(EVENT_TABLE.fields.targetId)
        .notNullable()
        .references(ORGANIZATION_TABLE.fields.id)
        .inTable(ORGANIZATION_TABLE.name);

      table.json(EVENT_TABLE.fields.payload);
    })
    .createTable(ORGANIZATION_TAGS_TABLE.name, function (table) {
      table
        .string(ORGANIZATION_TAGS_TABLE.fields.tag)
        .references(TAG_TABLE.fields.name)
        .inTable(TAG_TABLE.name)
        .notNullable();
      table
        .uuid(ORGANIZATION_TAGS_TABLE.fields.organizationId)
        .references(ORGANIZATION_TABLE.fields.id)
        .inTable(ORGANIZATION_TABLE.name)
        .notNullable();
      table
        .enu(ORGANIZATION_TAGS_TABLE.fields.type, [
          DICTIONARY.organizationTagsTypes.branch,
          DICTIONARY.organizationTagsTypes.skill,
          DICTIONARY.organizationTagsTypes.value,
        ])
        .notNullable();
      table.primary([
        ORGANIZATION_TAGS_TABLE.fields.tag,
        ORGANIZATION_TAGS_TABLE.fields.organizationId,
        ORGANIZATION_TAGS_TABLE.fields.type,
      ]);
    });
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.schema
    .dropTable(EVENT_TABLE.name)
    .dropTable(USER_TABLE.name)
    .dropTable(ORGANIZATION_TAGS_TABLE.name)
    .dropTable(ORGANIZATION_TABLE.name)
    .dropTable(TAG_TABLE.name);
};
