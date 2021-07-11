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
    async create(task, authorId, assigneeId, projectId) {
        try {
            const result = this.#tasks.request().query()
                .input("ProjectId", Int, projectId)
                .input("AuthorId", Int, authorId)
                .input("Title", Int, task.title)
                .input("Description", Int, task.description)
                .input("Status", Int, 1)
                .input("AssigneeId", Int, assigneeId)
                .execute("CreateTask")
            console.log(result);
        }
        catch(err) {
            console.error(err);
            return 55;
        }
    }

    // async update()

    // async delete()

    async getAll() {
        try {
            const result = await this.#tasks.request().query("SELECT * FROM vAllTasks");
            return result.recordset;
        }
        catch(err) {
            console.error(err);
        }
    }

    async getAllWithTeams() {
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