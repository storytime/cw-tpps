package cw

class Places  {
	float price;
	String time;
	String type;
	String decription;
	Collection hotNews;
	
	static hasMany = [hotNews:HotNews]
	static belongsTo = [fk_countris:Countries]
	

    static constraints = {
		
		price nullable:false;
		time nullable:false;
		type  nullable:false;
		decription  nullable:false;
		
		price(blank:false,range: 0..10000);
		time(blank: false, size:1..1000);
		type (inList:["1","2","3","4","5"]);
		decription(blank: false, size: 0..10000);
    }
}
