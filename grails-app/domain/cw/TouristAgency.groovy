package cw

class TouristAgency  {
	Date regDate;
	String owner;
	String decription;
	String phone;
	String name;
	String login;
	String passwdHash;

	static hasMany = [vacationPackage:VacationPackage]

	static constraints = {
		regDate(blank:false);
		owner(blank:false,size: 4..255);
		decription(blank:false,size: 0..10000);
		phone(blank:false,size: 4..12);
		name(blank:false,size: 4..25);
		login(blank:false,size: 4..25);
		passwdHash(blank:false,size: 4..25);
	}
}
