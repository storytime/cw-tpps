package cw

class Action {
	float discount;
	String decription;
	Date startDate;
	Date endDate;
	
	static hasMany = [vacationPackage:VacationPackage]
    static constraints = {
    }
}
