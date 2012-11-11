package cw

class Charter {
	Date startDate;
	String typeCharter;
	String classCharter
	float price;
	
	static hasMany = [vacationPackage:VacationPackage]
	
    static constraints = {
    }
}
