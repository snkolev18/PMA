// root/routes/collections/users.js


const express = require("express");
const router = express.Router();

const { DbSingleton } = require("../../lib/dbInstance");
const { UserRepository } = require("../../repositories/UserRepository");
const { isAdmin } = require("../../middlewares/authentication");
const { generateSalt, hashPassword } = require("../../lib/hash");

let users = undefined;

router.get("/", isAdmin, function(req, res) {
	res.send("<h1>Tova e adminskiya dashboard</h1><br><a href=\"/admin/users/\">Users</a>");
})

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

	const userForDeletion = await users.getUserById(id);

	// Logs : Empty array => []
	console.log(userForDeletion);
	if(userForDeletion.length === 0) {
		res.status(404).send("Error appeared");
		return;
	}

	res.render("editUser.ejs", {
		id: req.params.id
	});
});

router.post("/users/delete", async function(req, res) {
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

router.post("/users/edit/", async function(req, res) {
	console.log(req.body);
	const newUserCredentials = req.body;

	const salt = await generateSalt();
	const hashed = await hashPassword(newUserCredentials.password, salt);

	newUserCredentials.salt = salt;
	newUserCredentials.passwordHash = hashed;

	const sc = await users.update(newUserCredentials, newUserCredentials.id, req.session.token.id);
	if (sc) {
		res.send("There is already a user with this username. Try again");
		res.end();
		return;
	}

	res.redirect("/admin/users");
});

module.exports = router;

// This callbacks fire immediately so it can get the instance from the singleton class and then to make a single connection to the DB in the constructor of UsersRepository
(async () => {
	const temp = await DbSingleton.getInstance();
	users = new UserRepository();
	console.log("Connected");
})();