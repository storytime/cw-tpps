package cw

class User {

	String secondName;
	String phone;
	String passwdHash;
	String address;
	String email;
	String name;
	String avatar
	static hasMany = [vacationPackages:VacationPackage]

	static constraints = {

		secondName  nullable:false;
		phone  nullable:false;
		passwdHash  nullable:false;
		address  nullable:false;
		email nullable:false;
		name  nullable:false;
		avatar nullable: true
		secondName(blank:false,size: 4..25);
		phone(blank:false,size: 6..12);
		passwdHash(blank:false,size: 4..255);
		address(blank:false,size: 4..255);
		email(blank:false,email:true);
		name(blank:false,size: 4..25);
		avatar(blank:true)
	}
}
