const express = require("express");
const router = express.Router();
const { Mailer }= require("../../lib/mailer");
const mailer = new Mailer();

router.get("/", function(req, res) {
    res.render("contact.ejs");
});

router.post("/", function(req, res) {
    const mailInfo = req.body;
    mailer.send(mailInfo);
    res.redirect("/contact");
});

module.exports = router;