package cw

class Trip {
	float price;
	float rating;
	String decription;
	String type;
	String name;
	
	static hasMany = [countries:Countries]
	static belongsTo = [fk_vacationPackage:VacationPackage]
	
    static constraints = {
    }
}
