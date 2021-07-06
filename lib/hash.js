const bcrypt = require("bcrypt");

const saltRound = 5;
async function hashPassword(plainPassword) {
	let hashedWithSalt = null;
	let salt = null;
	bcrypt.genSalt(saltRound, (errRejected, saltResolved) => {
		if(errRejected) {
			console.error("Error while generating the salt");
			console.error(errRejected);
		}
		console.info(`Salt: ${saltResolved}`);
		bcrypt.hash(plainPassword, saltResolved, (err, hash) => {
			if(err) {
				console.error("Error while hashing the password");
				console.error(err);
			}
			else {
				hashedWithSalt = hash;
				salt = saltResolved;
				console.info(`Hash: ${hashedWithSalt}`);
			}
		})
	})

	return hashedWithSalt;
}


hashPassword("gay").then(result => console.log(result));