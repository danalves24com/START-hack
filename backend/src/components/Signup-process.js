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
		var sqls = [`create table company_members_${companyCode} (id int(9) AUTO_INCREMENT not null,name varchar(500) not null,interests varchar(5000) not null, contactInfor varchar(5000) not null,PRIMARY key (id))`, `insert into authentication_codes (code, company) values ("${companyCode}", "${this.name}")`];
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
