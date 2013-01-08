package cw

class IndexController {

    def index() { 
		def logining = false
		if (session.touristAgency==null && session.user==null && session.admin==null){
			logining = true
		}
		[placeInstanceList: Place.list(params),login:logining]
	}
	
	def Logout(){
		session.touristAgency=null
		session.user=null
		session.admin=null
		redirect(uri:'/')
	}
}
