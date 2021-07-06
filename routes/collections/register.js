// root/router/collections/register.js


const express = require("express");
const router = express.Router();

const { DbSingleton } = require("../../lib/dbInstance");
const { UserRepository } = require("../../repositories/UserRepository");
let users = undefined;

router.get("/", function(req, res) {
	res.render("register.ejs")
});

router.post("/", async function(req, res) {
	console.log(req.body);
	res.redirect("/");
});

module.exports = router;

(async () => {
	const temp = await DbSingleton.getInstance();
	users = new UserRepository();
	console.log("Connected");
})();