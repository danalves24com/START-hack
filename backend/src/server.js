const express = require("express");
const app = express();
var mysql = require('mysql');
var { Matcher } = require("./components/Matcher.js")
var { companyAccountCreator } = require("./components/Signup-process.js")
var {userSignup} = require("./components/userSignup.js");
var pass = require("./config/pass.js")
var ws = require("nodejs-websocket")
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


class client {
	constructor(con) {
		this.con = con
	}	
	setUUID(uuid) {this.uuid = uuid;}
	getUUID() {return this.uuid;}
	getCON() {return this.con;}
}


/*
 * WEBSOCKET
 */

var pool = {};

var server = ws.createServer(function (conn) {
	console.log("New connection")
    	var cli = new client(conn)
	conn.on("text", function (str) {
		str = JSON.parse(str);
		console.log(str);
		switch(str['event']) {
			case "id_self":				
				cli.setUUID(str['data']['UUID']);
				var id = cli.getUUID();
				pool[`${id}`] = cli;
				conn.sendText("helo "+id) // yes helo not hello
				break;
			case "send_to":
				var id = str["data"]["to"], payload = str["data"]["from"];			
				console.log("sending message to "+id);
				var message = {"event":"com_rec", "data":{"origin":cli.getUUID(), "message":payload}}
				var target = pool[id].getCON();
				console.log(target);
				target.sendText(JSON.stringify(message));
//				((pool[id]).getCON()).sendText(JSON.stringify(message));
				break;
		}


		/*
		if(str.includes("id_self")) {

		}
		else if (str=="id_me") {
			conn.sendText(cli.getUUID())
		}
		else if (str.includes("send_to")) {
			var id = str.split(":")[1], payload = str.split(":")[2];			
			console.log("sending message to "+id);
			for(var e in pool) {
				console.log(e)				
			}
			var message = {"event":"com_rec", "data":{"origin":cli.getUUID(), "message":payload}}
			((pool[`${id}`]).getCON()).sendText(JSON.stringify(message));
		}
		else {

		} 
		*/
		console.log("Received "+str)

	    })
	conn.on("close", function (code, reason) {
        	console.log("Connection closed")
		delete pool[cli.getUUID];
	})
}).listen(8001)


/*
 * ENDPOINTS
 */

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



app.get("/match/:uuid/:companyCode", (req, res) => {
	var m = new Matcher(req.params.uuid, req.params.companyCode);
	m.match(res)
})


app.get("/match_random/:uuid/:companyCode", (req, res) => {
	var m = new Matcher(req.params.uuid, req.params.companyCode);
	res.send(m.randomMatch());
})

app.listen(8000, () => console.log("server is running on port 8000"));
