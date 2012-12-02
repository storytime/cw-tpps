package cw

class VacationPackage {
	float priceFull;
	Date startDate;
	Date endDate;
	short people;
	
	static belongsTo = [fk_action : Action, fk_charter: Charter, fk_touristAgency:TouristAgency] //[fk_hotNews : HotNews, fk_charter : Charter, fk_users : Users, fk_action : Action, fk_touristAgency:TouristAgency]
	static hasMany = [trip:Trip]

	static constraints = {
		
		priceFull  nullable:false;
		startDate nullable:false;
		endDate  nullable:false;
		people  nullable:false;
		
		priceFull(blank:false,range: 0..10000);
		startDate(blank:false, min: new Date().setHours(0));
		endDate(blank:false,min: new Date().setHours(0));
		people(blank:false, range: 0..10);
	}
}
