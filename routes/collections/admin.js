// root/routes/collections/users.js


const express = require("express");
const router = express.Router();

const { DbSingleton } = require("../../lib/dbInstance");
const { UserRepository } = require("../../repositories/UserRepository");
const { isAuthenticated, isAdmin } = require("../../middlewares/authentication");

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

router.post("/users/delete", async function(req, res) {
	console.log("NA DELETE")
	console.log(req.body.id);

	// TO DO:
	// Fix it because req.body.id is an array of ids :()
	const userForDeletion = await users.getUserById(req.body.id);
	if(!userForDeletion) {
		res.status(404).send("Error appeared");
		return;
	}

	// console.log(userForDeletion);

	// const result = await users.delete(id);
	// console.info(result);

	// res.redirect("/");
});

module.exports = router;

(async () => {
	const temp = await DbSingleton.getInstance();
	users = new UserRepository();
	console.log("Connected");
})();