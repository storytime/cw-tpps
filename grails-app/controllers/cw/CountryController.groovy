package cw

import org.codehaus.groovy.grails.plugins.web.taglib.CountryTagLib;
import org.springframework.dao.DataIntegrityViolationException

class CountryController {
	def searchVacationPackage 
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [countryInstanceList: Country.list(params), countryInstanceTotal: Country.count()]
    }

    def create() {
		Locale[] locales = Locale.getAvailableLocales();
		def countries=[]	
		for (Locale locale : locales) {
			if (!locale.getDisplayCountry().isEmpty()&&!countries.contains(locale.getDisplayCountry())){
			countries.add(locale.getDisplayCountry())
			}
		}
		countries.sort()
        [countryInstance: new Country(params), countryList:countries]
    }

    def save() {
        def countryInstance = new Country(params)
		//countryInstance.name=Locale.availableLocales.find{it.ISO3Country == params['name']}
        if (!countryInstance.save(flush: true)) {
            render(view: "create", model: [countryInstance: countryInstance])
            return
        }
		if(session.touristAgency){
			session.touristAgency.mapWizard.put("country", countryInstance)
			redirect(controller:"trip", action:"create")
		   }
		   else
		   {
			   flash.message = message(code: 'default.created.message', args: [message(code: 'country.label', default: 'Country'), countryInstance.id])
			   redirect(action: "show", id: countryInstance.id)
		   }
    }

    def show(Long id) {
        def countryInstance = Country.get(id)
        if (!countryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'country.label', default: 'Country'), id])
            redirect(action: "list")
            return
        }

        [countryInstance: countryInstance]
    }

    def edit(Long id) {
        def countryInstance = Country.get(id)
        if (!countryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'country.label', default: 'Country'), id])
            redirect(action: "list")
            return
        }
		Locale[] locales = Locale.getAvailableLocales();
		def countries=[]
		for (Locale locale : locales) {
			if (!locale.getDisplayCountry().isEmpty()&&!countries.contains(locale.getDisplayCountry())){
			countries.add(locale.getDisplayCountry())
			}
		}
		countries.sort()
        [countryInstance: countryInstance, countryList:countries]
    }

    def update(Long id, Long version) {
        def countryInstance = Country.get(id)
        if (!countryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'country.label', default: 'Country'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (countryInstance.version > version) {
                countryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'country.label', default: 'Country')] as Object[],
                          "Another user has updated this Country while you were editing")
                render(view: "edit", model: [countryInstance: countryInstance])
                return
            }
        }

        countryInstance.properties = params
        if (!countryInstance.save(flush: true)) {
            render(view: "edit", model: [countryInstance: countryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'country.label', default: 'Country'), countryInstance.id])
        redirect(action: "show", id: countryInstance.id)
    }

    def delete(Long id) {
        def countryInstance = Country.get(id)
        if (!countryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'country.label', default: 'Country'), id])
            redirect(action: "list")
            return
        }

        try {
            countryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'country.label', default: 'Country'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'country.label', default: 'Country'), id])
            redirect(action: "show", id: id)
        }
    }
	def searchVacationPackage(){
		searchVacationPackage=new SearchVacationPackage()
		[vacationPackageList:searchVacationPackage.search(params.get("country"))]
	}
	
	def choose(Long id){
		def countryInstance = Country.get(id)
			session.touristAgency.mapWizard.put("country", countryInstance)
			redirect(controller:"trip", action:"create")
	}
	
	def createWizardCountry(Integer max){
		params.max = Math.min(max ?: 10, 100)
		[countryInstanceList: Country.list(params), countryInstanceTotal: Country.count()]
	}
}
