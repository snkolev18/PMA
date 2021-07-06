const { VarChar, NVarChar } = require("mssql/msnodesqlv8");
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

    async register(user) {
        try {
            const result = this.#users.request()
                .input("Username", VarChar, user.username)
                .input("HashedPassword", VarChar, user.hash)
                .input("Salt", VarChar, user.salt)
                .input("Firstname", NVarChar, user.fname)
                .input("Lastname", NVarChar, user.lname)
                .execute("RegisterUser")
            console.log(result);
        } 
        catch(error) {
            return 11;
        }
    }

    // Private members
    #users
}

exports.UserRepository = UserRepository
