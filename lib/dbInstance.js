const sql = require("mssql/msnodesqlv8");
const { config } = require("../config/database_config");

let db = undefined;

class DbSingleton {
	static async getInstance() {
		console.log(config);
		if (db === undefined) {
			db = await sql.connect(config);
		}
		else {
			console.log("There is already an existing instance of the DbSingleton!!!");
		}

		return db;
	}

	static getExistingInstance() {
		return db;
	}
};


exports.DbSingleton = DbSingleton;