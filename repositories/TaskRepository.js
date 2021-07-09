const { Int, NVarChar } = require("mssql/msnodesqlv8");
const sql = require("mssql/msnodesqlv8");
const { config } = require("../config/database_config");
const { DbSingleton } = require("../lib/dbInstance");


class TaskRepository {
    constructor() {
        this.#tasks = DbSingleton.getExistingInstance();
        console.info("Creating instance of TaskRepository");
    }

    // TO DO: Essential functionality:
    // async create()

    // async update()

    // async delete()

    #tasks
}

exports.TaskRepository = TaskRepository