const { check } = require("express-validator");

function validateRegisterCredentials(credentials) {
	let registerErrors = [];

	if(!/^[\w]{4,}$/.test(credentials.username)) {
		registerErrors.push( { message: "Username must be at least 4 characters" });
	}

	if(!/^[\w" !"#$%&'()*+,-.\/:;<=>?@[\]^_`{|}~"]{10,}$/.test(credentials.password)) {
		registerErrors.push( { message: "Password must be 10 or more characters" } );
	}

	return registerErrors;
}

function validateTPTCredentials(credentials) {
	let tptErrors = [];

	if(!/[а-яА-Я ]{4,}|[a-zA-Z ]{4,}/.test(credentials.title)) {
		tptErrors.push({ message: "Title must be at least 4 characters" });
	}

	if(!/[а-яА-Я ]{5,}|[a-zA-Z ]{4,}/.test(credentials.description)) {
		tptErrors.push({ message: "Description must be at least 5 characters" })
	}

	return tptErrors;
}

console.log(validateRegisterCredentials({username: "xuulthi", password: "randomPasswordForTesting123456789"}))
console.log(validateTPTCredentials({title: "ЛОЛБАС", description: "Misconfigured Windows binaries"}));


module.exports.validateRegisterCredentials = validateRegisterCredentials;
module.exports.validateTPTCredentials = validateTPTCredentials;