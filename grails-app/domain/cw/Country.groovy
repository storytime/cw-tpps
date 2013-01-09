package cw

class Country {
	String name;
	String wikiLink;
	Collection places;
	Collection hotels;
	
	static hasMany = [places:Place,hotels:Hotel,trips:Trip]
	static constraints = {

		wikiLink  nullable:false;

		wikiLink(blank:false,url:true,size: 4..255);
	}
	
	String toString(){
		"${name}"
	}
}
	