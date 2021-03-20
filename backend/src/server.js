const express = require("express");
const app = express();
var mysql = require('mysql');
var { Matcher } = require("./components/Matcher.js")
var { companyAccountCreator } = require("./components/Signup-process.js")
var {userSignup} = require("./components/userSignup.js");
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



app.use(express.json());
app.get("/add/company/:name", (req, res) => {
	let s = new companyAccountCreator(req.params.name);
	s.loadDatabaseConnection(con);
	s.createCompanyInstance();
	res.json({"status":"success", "payload":{"company_UID":s.getUID()}});
})

app.post("/add/user", (req, res) => {
	const {name, cc, interests} = req.body;
	console.log(name, cc, interests);
	var u = new userSignup(name, cc, interests, con);
	u.insert(res);

})

app.get("/stat", (req, res) => {
	res.send("running");		
})


app.get("/auth/:code", (req, res) => {

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
