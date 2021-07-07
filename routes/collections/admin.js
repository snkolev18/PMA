// root/routes/collections/users.js


const express = require("express");
const router = express.Router();

const { DbSingleton } = require("../../lib/dbInstance");
const { UserRepository } = require("../../repositories/UserRepository");
const { isAuthenticated, isAdmin } = require("../../middlewares/authentication");

let users = undefined;

router.get("/", isAdmin, function(req, res) {
	res.send("<h1>Tova e adminskiya dashboard</h1>");
})

router.get("/users", isAdmin, async function(req, res) {
	const users = await users.getAll();
	
	res.render("")
});

module.exports = router;

(async () => {
	const temp = await DbSingleton.getInstance();
	users = new UserRepository();
	console.log("Connected");
})();