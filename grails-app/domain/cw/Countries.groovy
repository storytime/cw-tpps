package cw

class Countries {
	String name;
	String wikiLink;
	Collection places;
	Collection hotels;

	static hasMany = [places:Places,hotels:Hotels]
	static belongsTo = [fk_trip:Trip]

	static constraints = {

		wikiLink  nullable:false;
		name nullable:false;

		wikiLink(blank:false,url:true,size: 4..255);
		name(blank:false,size: 4..25);
	}
}
