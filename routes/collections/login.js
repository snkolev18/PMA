// root/routes/collections/login.js


const express = require("express");
const router = express.Router();

const { DbSingleton } = require("../../lib/dbInstance");
const { UserRepository } = require("../../repositories/UserRepository");
const { hashPassword } = require("../../lib/hash");
let users = undefined;

router.get("/", function(req, res) {
	const errors = req.session.errors;
	if(req.session.token) {
		res.redirect("/logout");
		res.end();
		return;
	}
	if(errors) {
		res.render("login.ejs", { errors : errors })
		req.session.errors = [];
	}
	else {
		res.render("login.ejs", { errors : [] })
	}
});

router.post("/", async function(req, res) {
	const credentials = req.body;
	const username = credentials.username.toString();
	const password = credentials.password.toString();
	const salt = await users.getSaltByUsername(username);
	// Same as salt === undefined

	if (!salt) {
		req.session.errors = new Array();
	}
	else {

		// Logs { Salt: '<some user salt>' }
		console.log(salt);

		const passwordForVerification = await hashPassword(password, salt.Salt);
		const result = await users.login(username, passwordForVerification);

		console.log(result);

		if (result.idVerified) {
			req.session.token = {
				id: result.idVerified,
				username: username,
				roleId: result.roleId,
				firstname: result.firstname,
				lastname: result.lastname
			};

			console.log(req.session.token);

			if (req.session.returnUrl) {
				res.redirect(req.session.returnUrl);
			}
			else {
				res.redirect("/");
				console.log(`Current user ${req.session.token.username}`);
				res.end();
				return;
			}
		}
		else {
			console.log(req.session.token);
			req.session.errors = new Array();
			req.session.errors.push({ message: "Incorrect username or password" });
		}
	}
	res.redirect("/login");
});

module.exports = router;

(async () => {
	const temp = await DbSingleton.getInstance();
	users = new UserRepository();
	console.log("Connected");
})();