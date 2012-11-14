package cw

class Countries {
	String name;
	String wikiLink;
	
	static hasMany = [places:Places,hotels:Hotels]
	static belongsTo = [fk_trip:Trip]
	
    static constraints = {
		
		wikiLink  nullable:false;
		name nullable:false;
		
		wikiLink(blank:false,url:true);
		name(blank:false,size: 4..25);
    }
}
