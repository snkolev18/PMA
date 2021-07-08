const { Int, NVarChar } = require("mssql/msnodesqlv8");
const sql = require("mssql/msnodesqlv8");
const { config } = require("../config/database_config");
const { DbSingleton } = require("../lib/dbInstance");


class ProjectRepository {
    constructor() {
        this.#projects = DbSingleton.getExistingInstance();
        console.info("Creating instance of ProjectRepository");
    }

    async create() {
        try {
            
        }
        catch(err) {
            console.error(err);
            return 41;
        }
    }

    async update(newProjectData, id, lastModifiedById) {
        try {
            const result = await this.#projects.request()
                .input("Id", Int, id)
                .input("NewTitle", NVarChar, newProjectData.title)
                .input("NewDescription", NVarChar, newProjectData.description)
                .input("LastModifiedById", Int, lastModifiedById)
                .execute("UpdateProject");
            console.log(result);
        }
        catch(err) {
            console.error(err);
            return 44;
        }
    }


    async getAll() {
        try {
            const result = await this.#projects.request().query("SELECT * FROM vAllProjects");
            return result.recordset;
        }
        catch(err) {
            console.error(err);
        }
    }

    async getProjectById(id) {
        try {
            const result = await this.#projects.request().query`SELECT * FROM vAllProjects WHERE Id = ${id}`;
            return result.recordset;
        }
        catch(err) {
            console.error(err);
        }
    }

    // Private members
    #projects
    
}

exports.ProjectRepository = ProjectRepository