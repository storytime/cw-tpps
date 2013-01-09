package cw

class SearchVacationPackage {
 def search(String nameCountry){
	 def country=Country.findByName(nameCountry)
	 List vacationPackage=[]
	 country.trips.toList().each {
		vacationPackage.add(it.fk_vacationPackage)
	 }
	 return vacationPackage
 }
}
