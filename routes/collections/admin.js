// root/routes/collections/users.js


const express = require("express");
const router = express.Router();

const { DbSingleton } = require("../../lib/dbInstance");
const { UserRepository } = require("../../repositories/UserRepository");
const { TeamsRepository } = require("../../repositories/TeamsRepository");
const { isAdmin } = require("../../middlewares/authentication");
const { generateSalt, hashPassword } = require("../../lib/hash");

let users = undefined;
let teams = undefined;

router.get("/", isAdmin, function(req, res) {
	res.send("<h1>Tova e adminskiya dashboard</h1><br><a href=\"/admin/users/\">Users</a><br><a href=\"/admin/teams/\">Teams</a><br><a href=\"/admin/register/\">Register new user</a>");
})


router.get("/register", isAdmin, function(req, res) {
	res.render("register.ejs")
});

router.post("/register", isAdmin, async function(req, res) {
	const user = req.body;
	const salt = await generateSalt();
	const hashed = await hashPassword(user.password, salt);
	user.salt = salt;
	user.hash = hashed;
	console.log(user);
	const sc = await users.register(user, req.session.token.id);
	console.log(sc);
	if (sc) {
		res.send("Veche ima takuv username");
	}
	else {
		res.send("Dobre si");
	}
});

router.get("/users", isAdmin, async function(req, res) {
	const _users_ = await users.getAll();
	console.log(_users_);
	res.render("users.ejs", {
		users: _users_
	});
});

router.get("/users/edit/:id", isAdmin, async function(req, res) {
	const id = req.params.id;


	if (isNaN(id)) {
		res.send("Invalid ID")
		res.end();
		return;
	}

	const userExistence = await users.getUserById(id);

	// Logs : Empty array => []
	console.log(userExistence);
	if(userExistence.length === 0) {
		res.status(404).send("Error appeared");
		return;
	}

	res.render("editUser.ejs", {
		id: req.params.id,
		user: userExistence[0]
	});
});

router.post("/users/delete", isAdmin, async function(req, res) {
	console.log("NA DELETE")
	console.log(req.body.id);

	const id = req.body.id;
	const userForDeletion = await users.getUserById(id);
	if(!userForDeletion) {
		res.status(404).send("Error appeared");
		return;
	}

	console.log(userForDeletion);

	const result = await users.delete(id);
	console.info(result);
	res.redirect("/admin/users");
});

router.post("/users/edit/", isAdmin, async function(req, res) {
	console.log(req.body);
	const newUserCredentials = req.body;

	const salt = await generateSalt();
	const hashed = await hashPassword(newUserCredentials.password, salt);

	newUserCredentials.salt = salt;
	newUserCredentials.passwordHash = hashed;

	const sc = await users.update(newUserCredentials, newUserCredentials.id, req.session.token.id);
	if (sc) {
		res.send("There is already a user with this username. Try again!");
		res.end();
		return;
	}

	res.redirect("/admin/users");
});


router.get("/teams", isAdmin, async function(req, res) {
	const _teams_ = await teams.getAll();
	console.log(_teams_)
	res.render("teams.ejs", {
		teams: _teams_
	});
});

router.get("/teams/edit/:id", isAdmin, async function(req, res) {
	const id = req.params.id;

	if (isNaN(id)) {
		res.send("Invalid ID")
		res.end();
		return;
	}

	const teamExistence = await teams.getTeamById(id);
	// Logs : Empty array => []

	// Crashes on a non existing ID of a team
	console.log(teamExistence);
	if(teamExistence.length === 0) {
		res.status(404).send("Error appeared");
		return;
	}
	const _users_ = await users.getAll();

	res.render("editTeam.ejs", {
		id: req.params.id,
		users: _users_,
		team: teamExistence[0]
	});
});

router.post("/teams/edit", isAdmin, async function(req, res) {
	// TO DO: Add validation for invalid id from the request body, because the request itself can be repeated with web proxies such as Burp, that can interecept web traffic

	
	console.log(`Receiving new team's data ${req.body}`);
	const newTeamsData = req.body;

	const sc = await teams.update(newTeamsData, newTeamsData.id, req.session.token.id);
	if (sc) {
		res.send("There is already a team with this title. Try again!");
		res.end();
		return;
	}

	res.redirect("/admin/teams");
});

router.post("/teams/delete", isAdmin, async function(req, res) {
	console.log(req.body.id);

	const id = req.body.id;
	const teamForDeletion = await users.getUserById(id);
	if(!teamForDeletion) {
		res.status(404).send("Error appeared");
		return;
	}

	console.log(teamForDeletion);

	const result = await teams.delete(id);
	console.info(result);
	res.redirect("/admin/teams");
});

router.get("/teams/users", isAdmin, async function(req, res) {
	const result = await teams.getTeamsWithUsers();
	console.log(_users_);
	res.render("usersTeams.ejs", {
		teamsWithUsers: result
	});
});

router.post("/teams/assign", isAdmin, async function(req, res) {
	const data = req.body;
	const user = await users.getIdByUsername(data.username);
	console.log(user);
	if (user === undefined) {
		res.send("Non existing username");
		res.end();
		return;
	}
	console.log(data);
	const result = await teams.assignUserToTeam(data.teamId, user.Id);
	if (result) {
		res.send("This user is already in this team")
		res.send();
		return;
	}
	console.log(result);

	res.redirect("/admin/teams");
});

module.exports = router;

// This callbacks fire immediately so it can get the instance from the singleton class and then to make a single connection to the DB in the constructor of UsersRepository, TeamsRepository
(async () => {
	const temp = await DbSingleton.getInstance();
	users = new UserRepository();
	teams = new TeamsRepository();
	console.log("Connected");
})();