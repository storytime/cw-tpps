package cw

class IndexController {

    def index() { 
		[placeInstanceList: Place.list(params)]
	}
}
