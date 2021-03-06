package cw

class Place  {
	float price;
	String time;
	String type;
	String decription;
	String image
	static hasMany = [hotNews:HotNews]
	static belongsTo = [fk_countris:Country]
	

    static constraints = {
		
		price nullable:false;
		time nullable:false;
		type  nullable:false;
		decription  nullable:false;
		image nullable: true
		price(blank:false,range: 0..10000);
		time(blank: false, size:1..1000);
		type (inList:["1","2","3","4","5"]);
		decription(blank: false, size: 0..10000);		
		image(blank:true)
    }
	String toString(){
		"Country: ${fk_countris} time: ${time}"
	}
}
