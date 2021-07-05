const sql = require("mssql/msnodesqlv8");
const { config } = require("../config/database_config");
const { DbSingleton } = require("../lib/dbInstance");

class UserRepository {
    constructor() {
		this.#users = DbSingleton.getExistingInstance();
        console.info("Creating instance of UserRepository");
	}

    async getAll() {
        try {
            const result = this.#users.request().query("SELECT * FROM Users");
            return result;
        }
        catch (err) {
            console.error(err);
        }
    }

    // Private members
    #users
}

exports.UserRepository = UserRepository
