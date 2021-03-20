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
	  password: "Saniroot1678",
	  database: "coffee_time",
	  port: 3306,
	});


	con.connect(function(err) {
	  if (err) throw err;	 
	});
	this.con = con;
	}


	match(res) {

		var personalInterests = []
		var sql0 = `select * from company_members_${this.cc} where UUID ='${this.id}'`
		console.log(sql0)
		this.con.query(sql0, (e, r, f) => {
			if(r.length > 0 ) {				
				var i = r[0].interests
				i = i.split(", ")
				console.log(r, i);
				personalInterests = i;
			}
		})
		var sql = `select * from company_members_${this.cc}`
		var uidOG = this.id;
		var bestMatchScore = 0, bestMatchUUID = "";
		this.con.query(sql, (e, r, f) => {
		//	console.log(r);
			for(var u in r) {				
				u = r[u]
				if(u.UUID != uidOG) {
//					console.log(u, u.interests)
					var interests = (u.interests).split(", "), matched = 0;					
					for(var interest in interests) {
						interest = interests[interest];
						if(personalInterests.includes(interest)) {							
							matched+=1;							
						}
					}
					if(matched > bestMatchScore) {
						console.log("new best match found @ " + u.UUID)
						bestMatchScore = matched;
						bestMatchUUID = u.UUID;
					}
//			console.log(matched)

				}
			}
			if(bestMatchScore > 0) {
				res.json({"status":"success", "data":{"bestMatch":bestMatchUUID}})
			}
			else {
				res.json({"status":"fail"})
			}
		})

	}
	randomMatch() {
		return "randomly matched " + this.id;
	}

}
module.exports = {Matcher}
