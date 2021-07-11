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

    async getAll() {
        try {
            const result = await this.#tasks.request().query("SELECT * FROM vTasksWithTeams");
            return result.recordset;
        }
        catch(err) {
            console.error(err);
        }
    }


    #tasks
}

exports.TaskRepository = TaskRepository