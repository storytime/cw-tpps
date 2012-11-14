package cw

class Action  {
	float discount;
	String decription;
	Date startDate;
	Date endDate;
	
	static hasMany = [vacationPackage:VacationPackage]
    static constraints = {
		discount(blank: false, range: 0..99);
		decription(blank: false, size: 0..10000);
		endDate(blank:false, min: new Date());
		startDate (blank:false, min: new Date()+1);
	}
	
	
}
