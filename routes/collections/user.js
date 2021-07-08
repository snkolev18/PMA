// root/routes/collections/users.js


const express = require("express");
const router = express.Router();

const { DbSingleton } = require("../../lib/dbInstance");
const { UserRepository } = require("../../repositories/UserRepository");
const { TeamsRepository } = require("../../repositories/TeamsRepository");
const { ProjectRepository } = require("../../repositories/ProjectRepository");
const { isAuthenticated } = require("../../middlewares/authentication");

let users = undefined;
let teams = undefined;
let projects = undefined;
let tasks = undefined;

module.exports = router;


router.get("/projects");

// This callbacks fire immediately so it can get the instance from the singleton class and then to make a single connection to the DB in the constructor of UsersRepository, TeamsRepository
(async () => {
	const temp = await DbSingleton.getInstance();
	users = new UserRepository();
	teams = new TeamsRepository();
	projects = new ProjectRepository();
	console.log("Connected");
})();