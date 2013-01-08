package cw

class MapController {

    def index() { 
		redirect(action: "map")
	}
	def map() {
		String country ="";
		[countryName:country]
	}
}
