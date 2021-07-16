const mailer = require("nodemailer");
require("dotenv").config

class Mailer {
    constructor() {
        this.#mailConfig = {
			host: process.env.HOST,
			port: process.env.SMTP_PORT,
			secure: true,
			auth: {
				user: process.env.EMAIL,
				pass: process.env.EMAIL_PASSWORD
			}
		};
        console.log("Construiram se");
		this.#mailTransporter = mailer.createTransport(this.#mailConfig);
        console.log("Construirah se!!!");
    }

    send(info) {
        this.#mailBody = {
			from: info.email,
			to: process.env.EMAIL,
			subject: info.subject,
			html: `
				<h1> ${info.fname + info.lname} sent a message </h1>
				<p> ${info.message} </p>
			`
		};
        this.#mailTransporter.sendMail(this.#mailBody, function(err, info) {
			if(err) {
				console.log(err);
			}
			console.log(info);
		});
    }

    // Private members
    #mailConfig
    #mailTransporter
    #mailBody
}

exports.Mailer = Mailer;