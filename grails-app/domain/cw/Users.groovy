package cw

class Users {
	
	String secondName;
	String phone;
	String passwdHash;
	String address;
	String email;
	String name;
	
	static hasMany = [vacationPackage:VacationPackage]
		
    static constraints = {
    }
}
