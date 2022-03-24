require("dotenv").config();
const { databaseConfig } = require("./config");

module.exports = {
  client: "pg",
  connection: {
    host: databaseConfig.host,
    user: databaseConfig.user,
    password: databaseConfig.password,
    database: databaseConfig.database,
    charset: databaseConfig.charset,
  },
  pool: {
    min: 2,
    max: 10,
  },
  migrations: {
    tableName: "knex_migrations",
  },
};
