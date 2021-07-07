const { NVarChar, Int } = require("mssql/msnodesqlv8");
const sql = require("mssql/msnodesqlv8");
const { config } = require("../config/database_config");
const { DbSingleton } = require("../lib/dbInstance");


class TeamsRepository {
    constructor() {
        this.#teams = DbSingleton.getExistingInstance();
        console.info("Creating instance of TeamsRepository");
    }

    async create(team) {
        try {
            const result = await this.#teams.request()
                .input("Title", NVarChar, team.title)
                .input("Description", NVarChar, team.description)
                .input("CreatorId", NVarChar, team.creatorId)
                .execute("CreateTeam")
            console.log(`Created new team ${team.title}`);
        }
        catch(err) {
            console.error(err);
        }
    }

    async update(newTeamData, id, lastModifiedById) {
        try {
            const result = await this.#teams.request()
                .input("Id", Int, id)
                .input("NewTitle", NVarChar, newTeamData.title)
                .input("NewDescription", NVarChar, newTeamData.description)
                .input("LastModifiedById", Int, lastModifiedById)
                .execute("UpdateTeam");
            console.log(result);
        }
        catch(err) {
            console.error(err);
            return 33;
        }
    }

    async getAll() {
        try {
            const result = await this.#teams.request().query("SELECT * FROM vAllTeams");
            return result.recordset;
        }
        catch(err) {
            console.error(err);
        }
    }

    async getTeamById(id) {
        try {
            const result = await this.#teams.request().query`SELECT * FROM vAllTeams WHERE Id = ${id}`;
            return result.recordset;
        }
        catch(err) {
            console.error(err);
        }
    }
    // Private members
    #teams
};


exports.TeamsRepository = TeamsRepository;