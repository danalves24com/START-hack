const mysql = require("mysql");

class Matcher {

	constructor(id, cc) {
		this.id = id;	
		this.cc = cc;
		this.connectToDatabase();
	}


	connectToDatabase() {
		

	var con = mysql.createConnection({
	  host: "localhost",
	  user: "root",
	  password: "Saniroot",
	  database: "coffee_time",
	  port: 3306,
	});


	con.connect(function(err) {
	  if (err) throw err;
	  console.log("Connected!");
	});
	this.con = con;
	}


	match() {
		
		return "matched "+this.id; 
	}
	randomMatch() {
		return "randomly matched " + this.id;
	}

}
module.exports = {Matcher}
