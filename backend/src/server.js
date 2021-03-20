const express = require("express");
const app = express();
var mysql = require('mysql');
var { Matcher } = require("./components/Matcher.js")
var { companyAccountCreator } = require("./components/Signup-process.js")
var pass = require("./config/pass.js")
var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: pass,
  database: 'coffee_time',
  port: 3306,
});


con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});


app.get("/add/company/:name", (req, res) => {
	let s = new companyAccountCreator(req.params.name);
	s.loadDatabaseConnection(con);
	s.createCompanyInstance();
	res.send(s.getUID());
})


app.get("/stat", (req, res) => {
	res.send("running");		
})


app.get("/auth/:code", (req, res) => {
	
var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "Saniroot",
  database: 'edi',
  port: 3306,
});
})


app.get("/match/:uuid/:companyCode", (req, res) => {
	var m = new Matcher(req.params.uuid, req.params.companyCode);
	res.send(m.match());
})


app.get("/match_random/:uuid/:companyCode", (req, res) => {
	var m = new Matcher(req.params.uuid, req.params.companyCode);
	res.send(m.randomMatch());
})

app.listen(8000, () => console.log("server is running on port 8000"));
