module.exports = function(app) {
	app.use("/register", require("./collections/register"));
	app.use("/login", require("./collections/login"));
};

    