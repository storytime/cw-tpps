package cw

class Charter {
	Date startDate;
	String typeCharter;
	String classCharter
	float price;
	Collection va;
	
	static hasMany = [va:VacationPackage]
	
    static constraints = {
		
		startDate nullable:false;
		typeCharter nullable:false;
		classCharter nullable:false;
		price nullable:false;
		
		startDate (blank:false, min:new Date().setHours(0));
		typeCharter(inList:["Air","Ground","Water"]);
		classCharter (inList:["1","2","3","4","5"]);
		price (blank:false, range: 1..10000);
    }
}
