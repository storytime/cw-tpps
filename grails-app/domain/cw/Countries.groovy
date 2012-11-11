package cw

class Countries {
	String name;
	String wikiLink;
	
	static hasMany = [places:Places,hotels:Hotels]
	static belongsTo = [fk_trip:Trip]
	
    static constraints = {
    }
}
