package cw

class VacationPackage {
	float priceFull;
	Date startDate;
	Date endDate;
	short people;

	static belongsTo = [fk_hotNews : HotNews, fk_charter : Charter, fk_users : Users, fk_action : Action, fk_touristAgency:TouristAgency]
	static hasMany = [trip:Trip]

	static constraints = {
	}
}
