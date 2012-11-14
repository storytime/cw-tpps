package cw

class Charter {
	Date startDate;
	String typeCharter;
	String classCharter
	float price;
	
	static hasMany = [vacationPackage:VacationPackage]
	
    static constraints = {
		
		startDate nullable:false;
		typeCharter nullable:false;
		classCharter nullable:false;
		price nullable:false;
		
		startDate (blank:false, min: new Date());
		typeCharter(inList:["Air","Ground","Water"]);
		classCharter (inList:["1","2","3","4","5s"]);
		price (blank:false, range: 1..10000);
    }
}
