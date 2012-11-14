package cw

class VacationPackage {
	float priceFull;
	Date startDate;
	Date endDate;
	short people;

	static belongsTo = [fk_hotNews : HotNews, fk_charter : Charter, fk_users : Users, fk_action : Action, fk_touristAgency:TouristAgency]
	static hasMany = [trip:Trip]

	static constraints = {
		
		priceFull  nullable:false;
		startDate nullable:false;
		endDate  nullable:false;
		people  nullable:false;
		
		priceFull(blank:false,range: 0..10000);
		startDate(blank:false, min: new Date());
		endDate(blank:false,min: new Date()+1);
		people(blank:false, range: 0..10);
	}
}
