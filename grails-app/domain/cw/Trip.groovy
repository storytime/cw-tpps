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
		price(blank:false,range: 0..10000);
		rating(blank:true,range: 0..5);
		decription(blank:false,size: 0..10000);
		type(blank:false,nList:["Air","Water","Ground",]);
		name(blank:false,size: 0..255);
    }
}
