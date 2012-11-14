package cw

class Places  {
	float price;
	Date time;
	String type;
	String decription;
	
	static hasMany = [hotNews:HotNews]
	static belongsTo = [fk_countris:Countries]
	

    static constraints = {
		price(blank:false,range: 0..10000);
		time(blank: false, min:new Date());
		type (inList:["1","2","3","4","5"]);
		decription(blank: false, size: 0..10000);
    }
}
