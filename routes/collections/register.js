// root/routes/collections/register.js


const express = require("express");
const router = express.Router();

const { DbSingleton } = require("../../lib/dbInstance");
const { UserRepository } = require("../../repositories/UserRepository");
const { generateSalt, hashPassword } = require("../../lib/hash");
let users = undefined;

router.get("/", function(req, res) {
	res.render("register.ejs")
});

router.post("/", async function(req, res) {
	const user = req.body;
	const salt = await generateSalt();
	const hashed = await hashPassword(user.password, salt);
	user.salt = salt;
	user.hash = hashed;
	console.log(user);
	const sc = users.register(user);
	if (sc) {
		res.send("Veche ima takuv username");
	}
	else {
		res.send("Dobre si");
	}
});

module.exports = router;

(async () => {
	const temp = await DbSingleton.getInstance();
	users = new UserRepository();
	console.log("Connected");
})();