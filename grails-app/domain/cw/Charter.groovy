package cw

class Charter {
	Date startDate;
	String typeCharter;
	String classCharter
	String idNumber
	float price;
	
	static hasMany = [vacationPackages:VacationPackage]
	
    static constraints = {
		
		startDate nullable:false;
		typeCharter nullable:false;
		classCharter nullable:false;
		price nullable:false;
		idNumber nullable:false;
		idNumber(blank:false,matches:"[0-9]+", size:0..8,minSize:8);
		startDate (blank:false, min:new Date().setHours(0));
		typeCharter(inList:["Air","Ground","Water"]);
		classCharter (inList:["1","2","3","4","5"]);
		price (blank:false, range: 1..10000);
    }
}
