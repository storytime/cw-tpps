package cw

class Places {
	float price;
	Date time;
	String type;
	String decription;
	
	static hasMany = [hotNews:HotNews]
	static belongsTo = [fk_countris:Countries]
	

    static constraints = {
    }
}
