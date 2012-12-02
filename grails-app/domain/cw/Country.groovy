package cw

class Country {
	String name;
	String wikiLink;
	Collection places;
	Collection hotels;

	static hasMany = [places:Place,hotels:Hotel]
	static belongsTo = [fk_trip:Trip]

	static constraints = {

		wikiLink  nullable:false;
		name nullable:false;

		wikiLink(blank:false,url:true,size: 4..255);
		name(blank:false,size: 4..25);
	}
}