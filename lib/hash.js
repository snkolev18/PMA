const bcrypt = require("bcrypt");


async function generateSalt() {
	const saltRound = 5;
	return await bcrypt.genSalt(saltRound);
}

async function hashPassword(plainPassword, salt) {
	return await bcrypt.hash(plainPassword, salt);
}


// Temporary tests
generateSalt().then(salt => { 
	hashPassword("chicheto", salt).then(hashed => {
		console.log(hashed);
		console.log(bcrypt.compare("chicheto", hashed).then(result => { 
			console.log(result)
		}))
	})
});


module.exports.generateSalt = generateSalt;
module.exports.hashPassword = hashPassword;