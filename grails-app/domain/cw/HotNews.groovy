package cw

class HotNews {
	
	String decription;
	
	static hasMany = [vacationPackage:VacationPackage]
	static belongsTo = [fk_places:Places]

    static constraints = {
    }
}
