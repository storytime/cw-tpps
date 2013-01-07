package cw

class IndexController {

    def index() { 
		[placeInstanceList: Place.list(params)]
	}
	
	def Logout(){
		session.touristAgency=null
		session.user=null
		session.admin=null
		redirect(uri:'/')
	}
}
