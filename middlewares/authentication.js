function isAuthenticated(req, res, next) {
	if (!req.session.token) {
		req.session.returnUrl = req.originalUrl;
		res.redirect("/login");
		return;
	}
	next();
}

function isAdmin(req, res, next) {
	if(req.session.token) {
		if(req.session.token.roleId === 2) {
			next();
		}
		else{
			res.status(401).send("You are not allowed to view that page");
		}
	}
	else {
		res.redirect("/login");
	}
}

module.exports.isAuthenticated = isAuthenticated;
module.exports.isAdmin = isAdmin;