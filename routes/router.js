module.exports = function(app) {
	app.use("/register", require("./collections/register"));
	app.use("/login", require("./collections/login"));
	app.use("/admin", require("./collections/admin"));
	app.use("/user", require("./collections/user"));
};

    