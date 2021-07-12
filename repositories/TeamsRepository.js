const { NVarChar, Int } = require("mssql/msnodesqlv8");
const sql = require("mssql/msnodesqlv8");
const { config } = require("../config/database_config");
const { DbSingleton } = require("../lib/dbInstance");


class TeamsRepository {
    constructor() {
        this.#teams = DbSingleton.getExistingInstance();
        console.info("Creating instance of TeamsRepository");
    }

    async create(team, creatorId) {
        try {
            const result = await this.#teams.request()
                .input("Title", NVarChar, team.title)
                .input("Description", NVarChar, team.description)
                .input("CreatorId", NVarChar, creatorId)
                .execute("CreateTeam")
            console.log(`Created new team ${team.title}`);
        }
        catch(err) {
            console.error(err);
            return 31;
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

    async delete(id) {
        try {
            const result = await this.#teams.request()
                .input("Id", Int, id)
                .execute("DeleteTeam")
            console.log(result);
        }
        catch (err) {
            console.error(err);
            return 34;
        }
    }

    async assignUserToTeam(teamId, userId) {
        try {
            const result = await this.#teams.request()
                .input("TeamId", Int, teamId)
                .input("UserId", Int, userId)
                .execute("AssignUserToTeam")
            console.log(result);
        }
        catch (err) {
            console.error(err);
            return 35;
        }
    }

    async getTeamsWithUsers() {
        try {
            const result = await this.#teams.request().query("SELECT * FROM vTeamsWithUsers");
            return result.recordset;
        }
        catch (err) {
            console.error(err);
        }
    }

    async getTeamWithUsersById(id) {
        try {
            const result = await this.#teams.request().query`SELECT * FROM vTeamsWithUsers WHERE TeamId = ${id}`;
            return result.recordset[0];
        }
        catch(err) {
            console.log(err);
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

    async getIdByTitle(title) {
        try {
            const result = await this.#teams.request().query`SELECT Id FROM Teams WHERE Title = ${title} AND IsDeleted = 0`;
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