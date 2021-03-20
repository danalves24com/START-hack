const { v4: uuidv4 } = require('uuid');

class companyAccountCreator {
	
	constructor(name) {
		this.name = name;
		this.con = "";
	}


	loadDatabaseConnection(conI) {
		this.con = conI;
	}


	getUID() {
		return this.uid;
	}


	createCompanyInstance() {
		var companyCode = uuidv4();
		companyCode = companyCode.replace(/-/g, "");
		this.uid = companyCode;
		  
		var sqls = [`create table company_members_${companyCode} (id int(9) NOT NULL,name varchar(500) NOT NULL,interests varchar(5000) NOT NULL,contact varchar(5000) NOT NULL, UUID varchar(4096) NOT NULL, AUTH_KEY varchar(255) NOT NULL)`, `insert into authentication_codes (code, company) values ("${companyCode}", "${this.name}")`];
		for(var sql in sqls) {
			sql = sqls[sql];
			this.con.query(sql, function(err, results, fields) {
				if(err) throw err;
				console.log(results);
			}) 
		}
	}

}

module.exports =  { companyAccountCreator }
