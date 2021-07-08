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


router.get("/projects", isAuthenticated, async function(req, res) {
	const _projects_ = await projects.getAll();
	res.render("projects.ejs", {
		projects: _projects_,
		loggedUserId: req.session.token.id
	})
});

router.get("/project/edit/:id", isAuthenticated, async function(req, res) {
	const id = req.params.id;


	if (isNaN(id)) {
		res.send("Invalid ID")
		res.end();
		return;
	}

	const projectExistence = await projects.getProjectById(id);

	// Logs : Empty array => []
	console.log(projectExistence);
	if(projectExistence.length === 0) {
		res.status(404).send("Error appeared");
		return;
	}

    // Returns array with an object so that why is the [0]
	const _teams_ = await teams.getAll();
	res.render("editProject.ejs", {
		teams: _teams_,
		id: id,
		project: projectExistence[0]
	})

});

router.post("/project/edit/", isAuthenticated, async function(req, res) {
	console.info(`Receiving new project data: ${req.body}`);
	const newProjectData = req.body;
	console.log(newProjectData);
	const sc = await projects.update(newProjectData, newProjectData.id, req.session.token.id);
	if (sc) {
		res.send("There is already a project with this title. Try again!");
		res.end();
		return;
	}

	res.redirect("/user/projects");
});

// This callbacks fire immediately so it can get the instance from the singleton class and then to make a single connection to the DB in the constructor of UsersRepository, TeamsRepository
(async () => {
	const temp = await DbSingleton.getInstance();
	users = new UserRepository();
	teams = new TeamsRepository();
	projects = new ProjectRepository();
	console.log("Connected");
})();