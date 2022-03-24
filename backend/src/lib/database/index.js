const { databaseConfig } = require("../../config");

const knex = require("knex")({
  client: "pg",
  connection: {
    host: databaseConfig.host,
    port: databaseConfig.port,
    user: databaseConfig.user,
    password: databaseConfig.password,
    database: databaseConfig.database,
    charset: databaseConfig.charset,
  },
  migrations: {
    tableName: "migrations",
  },
});

module.exports = knex;
