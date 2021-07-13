const rateLimit = require("express-rate-limit");


function configureLimiter(maxRequests, perMinutes, statusCodeOnFail = 429) {
	const apiLimiter = rateLimit({
		windowMs: perMinutes * 60 * 1000,
		max: maxRequests,
		handler: (req, res, next) => {
			res.status(statusCodeOnFail).render("errorPage.ejs", {
				statusCode: statusCodeOnFail,
				errorMessage: "You have exceeded your requests"
			});
		}
	});
	return apiLimiter;
}

module.exports.configureLimiter = configureLimiter;