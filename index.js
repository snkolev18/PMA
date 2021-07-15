require("dotenv").config();
const express = require("express")
const bodyParser = require("body-parser");
const session = require("express-session")
const app = express();
const { DbSingleton } = require("./lib/dbInstance");
const { UserRepository } = require("./repositories/UserRepository");
const { isAuthenticated, isAdmin } = require("./middlewares/authentication");
const helmet = require("helmet");

const PORT = process.env.SERVER_PORT || 1337

let users = undefined;

app.disable("x-powered-by");
app.use(helmet.contentSecurityPolicy(
	{
		useDefaults: false,
		directives: {
			defaultSrc: helmet.contentSecurityPolicy.dangerouslyDisableDefaultSrc,
			scriptSrc: ["'self'", "https://www.gstatic.com/", "https://code.jquery.com/", "https://cdn.jsdelivr.net/", "https://unpkg.com/", "'sha256-n0en0GASyF55nxk0nHbKi/6ZUXOA1GNDcBPfaP8JnpY='", "'sha256-YvxtAQBnFRbNciqp3bRW6t7A6lGk0ltLyki9K/wUb5w='", "'sha256-9SzKCoCiq2D39Ny+d7S/c/kSAfvvgn3Nux1cgiTMhAo='", "'sha256-m/ms/a5rxV5J+2L2RKdxZAVQmJ8HpkReie32QXXXoRU='", "'sha256-GYglk0Yy1AhqVI2bQqKjHVh7Bai7YQ5guev2OdscHOQ='"],
			objectSrc: ["'none'"],
			upgradeInsecureRequests: [],
			imgSrc: ["'self'", "data:", "https://investsofia.com/wp-content/uploads/2019/08/facebook-default-no-profile-pic-300x300.jpg", "https://mdbootstrap.com/img/new/standard/city/053.jpg"],
			fontSrc: ["'self'", "'unsafe-inline'", "https://fonts.googleapis.com/", "https://fonts.gstatic.com", "https://www.gstatic.com/"],
			styleSrc: ["'self'", "'unsafe-inline'", "https://cdn.jsdelivr.net/", "https://fonts.gstatic.com/", "https://fonts.googleapis.com/", "https://getbootstrap.com", "https://cdnjs.cloudflare.com", "https://stackpath.bootstrapcdn.com", "https://www.gstatic.com/"]
		}
	}
), helmet.crossOriginResourcePolicy());

// Servers static files like css, html and looks for them in the public folder
app.use("/styles", express.static("public/styles"))
app.use("/js", express.static("public/js"))
app.use("/img", express.static("public/img"))

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

// TO DO: FIX EVERY DELETE OPERATION, USE TRIGGER OR DO A MANUAL DELETION OF EVERY RELATIONAL INTEGRITY INSIDE A STORED PROCEDURE FOR DELETING AN ENTITY

require("./routes/router")(app);

app.get("/", function(req, res) {
	if (req.session.token) {
		let root = req.session.token.roleId === 2 ? true : false; 
		res.render("index.ejs", { 
			logged: true,
			root: root,
			username: req.session.token.username
		})
	}
	else {
		res.render("index.ejs", { 
			logged : false,
			root: false,
			username: undefined
		})
	}
})

app.get("/protectedTempRoute", isAuthenticated, function(req, res) {
	res.send(`<h1>Hello, ${req.session.token.username}</h1>`)
});

app.get("/adminOnlyRoute", isAdmin, function(req, res) {
	res.send(`<h1>Hello, admin user ${req.session.token.username}</h1>`);
});

app.get("/logout", isAuthenticated, function(req, res) {
	req.session.token = null;
	res.redirect("/");
});

app.get("*", function(req, res) {
	res.status(404).render("errorPage.ejs", {
		statusCode: 404,
		errorMessage: "Page not found"
	});
});

app.listen(PORT, async () => {
	console.info(`Server started on port ${PORT}`);
	console.log(`Connecting to Database: ${process.env.DATABASE}`);

	const temp = await DbSingleton.getInstance();

	console.log("Created database instance");
	
	users = new UserRepository();
})