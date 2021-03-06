package cw

class Admin {
	String name;
	String secondName;
	String phone;
	String login;
	String passwdHash;
	String email;
	int age;
	String avatar
	static constraints = {

		email nullable:false
		name nullable: false
		secondName nullable: false
		phone nullable: false
		login nullable: false
		passwdHash nullable: false
		avatar nullable: true
		age(blank:false, range: 18..100)
		email (blank:false, email: true)
		name (blank:false, size: 4..25)
		secondName (blank:false, size: 4..25)
		phone (blank:false, size: 6..12)
		login  (blank:false, size: 4..25)
		passwdHash (blank:false, size: 4..255)
		avatar(blank:true)
	}
}
