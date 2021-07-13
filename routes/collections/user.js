// root/routes/collections/users.js


const express = require("express");
const router = express.Router();

const { DbSingleton } = require("../../lib/dbInstance");
const { UserRepository } = require("../../repositories/UserRepository");
const { TeamsRepository } = require("../../repositories/TeamsRepository");
const { ProjectRepository } = require("../../repositories/ProjectRepository");
const { TaskRepository } = require("../../repositories/TaskRepository");
const { isAuthenticated } = require("../../middlewares/authentication");
const { Router } = require("express");

let users = undefined;
let teams = undefined;
let projects = undefined;
let tasks = undefined;

module.exports = router;


router.get("/profile", isAuthenticated, async function(req, res) {
	const profile = await users.getUserById(req.session.token.id);
	const role = req.session.token.roleId === 2 ? "Admin" : "User";
	console.log("AAAA")
	console.log(profile);

	let tempProjects = await projects.getAll();
	const _projects_ = tempProjects.filter(project => project.CreatorId === req.session.token.id);
	
	const tempTasks = await tasks.getAllWithTeams();
	console.log(tempTasks);
	console.log("!!!==================!!!")
	const _tasks_ = tempTasks.filter(task => task.AuthorId === req.session.token.id);
	console.log(_tasks_)

	const tempAssignedTasks = await tasks.getAll();
	const assignedTasks = tempAssignedTasks.filter(assignedTask => assignedTask.AssigneeUsername === req.session.token.username);

	const tempTeams = await teams.getTeamsWithUsers();
	const _teams_ = tempTeams.filter(team => team.Username === req.session.token.username);
	console.log(_teams_);

	let root = req.session.token.roleId === 2 ? true : false;

	res.render("profile.ejs", {
		profile: profile[0],
		role: role,
		projects: _projects_,
		tasks: _tasks_,
		assignedTasks: assignedTasks,
		teams: _teams_,
		logged: true,
		root: root
	});
});

router.get("/profile/view/team/:id", isAuthenticated, async function(req, res) {
	const id = req.params.id;
	if (isNaN(id)) {
		res.send("Invalid ID")
		res.end();
		return;
	}

	const teamExistence = await teams.getTeamWithUsersById(id);
	// Logs : Empty array => []
	// Crashes on a non existing ID of a team
	console.log(teamExistence);
	if(teamExistence.length === 0) {
		res.status(400).render("errorPage.ejs", {statusCode: 400, errorMessage: "Bad request"});
		return;
	}
	
	let isAllowedToView = false;
	teamExistence.map(team => {
		if(team.Username === req.session.token.username) {
			isAllowedToView = true;
		}
	});

	if(!isAllowedToView) {
		res.status(401).render("errorPage.ejs", {statusCode: 401, errorMessage: "Not authorized to view that resource"});
		res.end();
		return;
	}

	const tasksExistence = await tasks.getAllWithTeamById(id);
	const projectsExistence = await projects.getAllWithTeamById(id);
	res.render("viewTeam.ejs", {
		// Doesn't matter which element of the array is returned, the information for the team is always the same except for the Username property
		team: teamExistence[0],
		tasks: tasksExistence,
		projects: projectsExistence
	});
});

//							PROJECTS

router.get("/projects", isAuthenticated, async function(req, res) {
	const _projects_ = await projects.getAll();
	res.render("projects.ejs", {
		projects: _projects_,
		loggedUserId: req.session.token.id
	})
});

router.get("/project/create", isAuthenticated, async function(req, res) {
	res.render("createProject.ejs");
});

router.post("/project/create", isAuthenticated, async function(req, res) {
	const project = req.body;
	console.log(project);
	const sc = await projects.create(project, req.session.token.id);
	if (sc) {
		res.send("There is already a project with this name");
		res.end();
		return;
	}
	res.redirect("/user/projects");
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

	if (projectExistence[0].CreatorId != req.session.token.id) {
		res.send("Encountered an error");
		res.end();
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


router.post("/project/delete", isAuthenticated, async function(req, res) {
	console.info("Deleting project");

	const id = req.body.id;

	const projectForDelete = await projects.getProjectById(id)
	console.log(projectForDelete);
	if(projectForDelete.length === 0) {
		res.status(401).render("errorPage.ejs", {statusCode: 404, errorMessage: "Bad request"});
		return;
	}

	if (projectForDelete[0].CreatorId != req.session.token.id) {
		res.status(403).render("errorPage.ejs", {statusCode: 403, errorMessage: "Forbidden"});
		res.end();
		return;
	}

	const result = await projects.delete(id);
	console.log(result);

	res.redirect("/user/projects");
});

router.post("/project/assign", isAuthenticated, async function(req, res) {
	const data = req.body;
	const team = await teams.getIdByTitle(data.title);
	const checkProjectCreator = await projects.getProjectById(data.projectId);
	if (req.session.token.id !== checkProjectCreator[0].CreatorId) {
		res.status(403).render("errorPage.ejs", {statusCode: 403, errorMessage: "Forbidden"});
		res.end();
		return;
	}

	// Logs : An array with one object and propery id => e.x [ { Id: 1 } ]
	console.log(team);
	if (team === undefined || team.length === 0) {
		res.send("Non existing team");
		res.end();
		return;
	}

	console.log(data);
	const result = await projects.assignProjectToTeam(data.projectId, team[0].Id);
	if (result) {
		res.send("This team is already assigned to this project")
		res.send();
		return;
	}
	console.log(result);

	res.redirect("/user/projects");
});

// 				##############################################


router.get("/tasks", isAuthenticated, async function(req, res) {
	const _tasks_ = await tasks.getAll();
	res.render("tasks.ejs", {
		tasks: _tasks_,
		currentUserId: req.session.token.id
	})
});

router.get("/task/create", isAuthenticated, async function(req, res) {
	const _users_ = await users.getAll();
	const _projects_ = await projects.getAll();
	console.log(_projects_);
	res.render("createTask.ejs", {
		users: _users_,
		projects: _projects_
	});
});

router.post("/task/create", isAuthenticated, async function(req, res) {
	const task = req.body;
	console.log(task);
	if(isNaN(task.assigneeId)) {
		res.send("Invalid assignee id");
		res.end();
		return;
	}
	const assigneeExistenceId = await users.getUserById(task.assigneeId);
	console.log(assigneeExistenceId)
	if(assigneeExistenceId === undefined) {
		res.send("This user doesn't exist");
		res.end();
		return;
	}
	if(isNaN(task.projectId)) {
		res.send("Invalid project id");
		res.end();
		return;
	}
	const projectExistence = await projects.getProjectById(task.projectId);
	console.log(projectExistence);
	if (projectExistence[0] === undefined) {
		res.send("This project doesn't exist");
		res.end();
		return;
	}

	const sc = await tasks.create(task, req.session.token.id, task.assigneeId, task.projectId);
	if(sc) {
		res.send("There is already a task with this title");
		res.end();
		return;
	}

	res.redirect("/user/profile");
});

router.post("/update/project/status", isAuthenticated, async function(req, res) {
	const data = req.body;
	data.status = data.status.map(status => {
		if(status === "Open this select menu") {
			status = "1";
		}
		return status
	})
	console.log(data);
	
	for(let i = 0; i < 3; i++) {
		const sc = await tasks.updateStatus(data.id[i], data.status[i]);
		console.log(sc);
	}
	res.redirect("/user/profile");
});


// This callbacks fire immediately so it can get the instance from the singleton class and then to make a single connection to the DB in the constructor of UsersRepository, TeamsRepository
(async () => {
	const temp = await DbSingleton.getInstance();
	users = new UserRepository();
	teams = new TeamsRepository();
	projects = new ProjectRepository();
	tasks = new TaskRepository();
	console.log("Connected");
})();