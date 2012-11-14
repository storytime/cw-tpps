package cw

class Hotels {
	String name;
	float pricePerDay;
	String rest;

	static belongsTo = [fk_countries:Countries]
		
	static constraints = {
		name(blank:false,size: 4..255);
		pricePerDay(blank:false,range: 0..10000);
		rest(blank:true,size: 4..255);
	
	}
}
