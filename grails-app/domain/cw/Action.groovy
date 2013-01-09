package cw

class Action  {
	float discount;
	String decription;
	Date startDate;
	Date endDate;
	
	static hasMany = [vacationPackages:VacationPackage]
	static constraints = {

		discount nullable:false;
		decription  nullable:false;
		endDate nullable:false;
		startDate  nullable:false;

		discount(blank: false, range: 0.1..99);
		decription(blank: false, size: 0..10000);
		endDate(blank:false, min: new Date().setHours(0));
		startDate (blank:false, min: new Date().setHours(0));
	}
	
	String toString() {
		"${discount}%"
	}
}
