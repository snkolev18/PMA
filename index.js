require("dotenv").config();
const express = require("express")
const app = express();
const { DbSingleton } = require("./lib/dbInstance");
const { UserRepository } = require("./repositories/UserRepository");

let users = undefined;
let aritcles = undefined;

const PORT = process.env.SERVER_PORT || 1337



app.get("/", async function(req, res) {
	const allUsers = await users.getAll();
	console.log(allUsers);
	res.json(allUsers);
})

app.listen(PORT, async () => {
	console.info(`Server started on port ${PORT}`);
	console.log(`Connecting to Database: ${process.env.DATABASE}`);

	const temp = await DbSingleton.getInstance();

	users = new UserRepository();
})