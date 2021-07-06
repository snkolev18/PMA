const { VarChar, NVarChar, Int, TinyInt } = require("mssql/msnodesqlv8");
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
            const result = await this.#users.request().query("SELECT * FROM Users");
            return result;
        }
        catch (err) {
            console.error(err);
        }
    }

    async register(user) {
        try {
            const result = await this.#users.request()
                .input("Username", VarChar, user.username)
                .input("HashedPassword", VarChar, user.hash)
                .input("Salt", VarChar, user.salt)
                .input("Firstname", NVarChar, user.fname)
                .input("Lastname", NVarChar, user.lname)
                .execute("RegisterUser")
            console.log(result);
        } 
        catch(err) {
            console.error(err);
            return 11;
        }
    }

    async login(username, passwordHash) {
        try {
            const result = await this.#users.request()
                .input("Username", VarChar, username)
                .input("PasswordHashWithSaltIncoming", VarChar, passwordHash)
                .output("IsVerified", Int)
				.output("RoleId", TinyInt)
                .output("Firstname", NVarChar)
                .output("Lastname", NVarChar)
                .execute("VerifyLogin")
            console.log(result);
            return {
				idVerified: result.output.IsVerified,
				roleId: result.output.RoleId,
                firstname: result.output.Firstname,
                lastname: result.output.Lastname,
			}
        }
        catch(err) {
            console.error(err);
        }
    }

    async getSaltByUsername(username) {
        try {
            const salt = await this.#users.request().query`SELECT Salt from Users WHERE Username = ${username}`;
            return salt.recordset[0];
        }
        catch (err) {
            console.error(err);
            return 12;
        }
    }

    // Private members
    #users
    
}

exports.UserRepository = UserRepository
