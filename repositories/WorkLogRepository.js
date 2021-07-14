const { Int, NVarChar } = require("mssql/msnodesqlv8");
const sql = require("mssql/msnodesqlv8");
const { config } = require("../config/database_config");
const { DbSingleton } = require("../lib/dbInstance");


class WorkLogRepository {
    constructor() {
        this.#workLogs = DbSingleton.getExistingInstance();
        console.info("Creating instance of WorkLogRepository");
    }

    async create() {
        
    }

    #workLogs
}

exports.WorkLogRepository = WorkLogRepository