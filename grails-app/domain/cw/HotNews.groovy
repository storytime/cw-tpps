package cw

class HotNews {

	String decription;

	static hasMany = [vacationPackage:VacationPackage]
	static belongsTo = [fk_places:Places]

	static constraints = {
		decription(blank: false, size: 0..10000);
	}
}
