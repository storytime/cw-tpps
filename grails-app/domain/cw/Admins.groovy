package cw

class Admins {
	String name;
	String secondName;
	String phone;
	String login;
	String passwdHash;
	String email;
	int age;

	static constraints = {
		age(blank:false, range: 18..100);
		email (blank:false, email: true);
		name (blank:false, size: 4..25);
		secondName (blank:false, size: 4..25);
		phone (blank:false, size: 6..12);
		login  (blank:false, size: 4..25);
		passwdHash (blank:false, size: 4..255);
	}
}
