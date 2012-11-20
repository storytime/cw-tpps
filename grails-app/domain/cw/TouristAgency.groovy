package cw

class TouristAgency  {
	Date regDate;
	String owner;
	String decription;
	String phone;
	String name;
	String login;
	String passwdHash;
	Collection va;

	static hasMany = [va:VacationPackage]

	static constraints = {

		regDate nullable:false;
		owner nullable:false;
		decription nullable:false;
		phone nullable:false;
		name nullable:false;
		login nullable:false;
		passwdHash nullable:false;

		regDate(blank:false,min:new Date().setHours(0));
		owner(blank:false,size: 4..255);
		decription(blank:false,size: 0..10000);
		phone(blank:false,size: 4..12);
		name(blank:false,size: 4..25);
		login(blank:false,size: 4..25);
		passwdHash(blank:false,size: 4..25);
	}
}
