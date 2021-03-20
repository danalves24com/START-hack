const { v4: uuidv4 } = require('uuid');
class userSignup {

	constructor(name, cc, interests, con){
		this.name = name
		this.cc = cc;
		this.interests = interests
		this.con = con
	}

	addUser() {

	}


	insert(res) {

		var UUID = uuidv4();
		UUID = UUID.replace(/-/g, "");
		var c = this.con
		var data = [this.name, this.interests]
		var companyUID = this.cc;
		this.con.query(`select * from authentication_codes where code='${this.cc}'`, function(e, r, f) {
			//			if (e ) throws e;
			console.log(r)
			console.log(r.length > 0)
			if(r.length > 0) {
			 	var key = uuidv4().split('-')[0];			
				var sql = `INSERT into company_members_${companyUID} (name, interests, contact, UUID, AUTH_KEY) values ("${data[0]}", "${data[1]}", "nada", "${UUID}", "${key}");`
				c.query(sql, (e, r ,f) => {
					if(e) {console.log(e);res.json({"status":"fail"})}
					console.log(r);
					res.json({"status":"success", "payload": {"UUID":UUID, "AUTH_KEY":key}});

				})
	
			}
			
			
		})
		
	}
	create(res) {
		this.isValid();

	}

}

module.exports = {userSignup}
