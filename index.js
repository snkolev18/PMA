require("dotenv").config();
const express = require("express")
const bodyParser = require("body-parser");
const session = require("express-session")
const app = express();
const { DbSingleton } = require("./lib/dbInstance");
const { UserRepository } = require("./repositories/UserRepository");
const { isAuthenticated, isAdmin } = require("./middlewares/authentication");
const PORT = process.env.SERVER_PORT || 1337

let users = undefined;

// Servers static files like css, html and looks for them in the public folder
app.use("/styles", express.static("public/styles"))

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended : true }));
app.set("views", "./views");

app.use(session({
	secret: process.env.SESSION_SECRET,
	secure: true,
	resave: false,
	saveUninitialized: true,
	cookie: {
		httpOnly: true,
		// Expires after 1 day
		expires: 24 * 60 * 60 * 1000
	}
}));



require("./routes/router")(app);

app.get("/", async function(req, res) {
	res.render("index.ejs")
})

app.get("/protectedTempRoute", isAuthenticated, function(req, res) {
	res.send(`<h1>Hello, ${req.session.token.username}</h1>`)
});

app.get("/adminOnlyRoute", isAdmin, function(req, res) {
	res.send(`<h1>Hello, admin user ${req.session.token.username}</h1>`);
});

app.listen(PORT, async () => {
	console.info(`Server started on port ${PORT}`);
	console.log(`Connecting to Database: ${process.env.DATABASE}`);

	const temp = await DbSingleton.getInstance();

	console.log("Created database instance");
	
	users = new UserRepository();
})