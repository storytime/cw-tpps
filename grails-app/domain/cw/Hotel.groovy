package cw

class Hotel {
	String name;
	float pricePerDay;
	String rest;

static belongsTo = [fk_countries:Country]

	static constraints = {

		name nullable:false;
		pricePerDay nullable:false;
		rest nullable:false;

		name(blank:false,size: 4..255);
		pricePerDay(blank:false,range: 0..10000);
		rest(blank:true,size: 4..255);
	}
}
