package cw

class Hotels {
	String name;
	float pricePerDay;
	String rest;

	static belongsTo = [fk_countries:Countries]
		
	static constraints = {
	}
}
