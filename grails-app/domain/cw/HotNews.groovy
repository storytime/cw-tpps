package cw

class HotNews {

	String decription;

	static hasMany = [vacationPackages:VacationPackage]
	static belongsTo = [fk_places:Place]

	static constraints = {
		decription nullable:false;
		decription(blank: false, size: 0..10000);
	}
}
