package cw

import org.springframework.dao.DataIntegrityViolationException

class TouristAgencyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index(Integer max) {
        //redirect(action: "list", params: params)
		params.max = Math.min(max ?: 10, 100)
		[touristAgencyInstanceList: TouristAgency.list(params), touristAgencyInstanceTotal: TouristAgency.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [touristAgencyInstanceList: TouristAgency.list(params), touristAgencyInstanceTotal: TouristAgency.count()]
    }

    def create() {
        [touristAgencyInstance: new TouristAgency(params)]
    }

    def save() {
        def touristAgencyInstance = new TouristAgency(params)
        if (!touristAgencyInstance.save(flush: true)) {
            render(view: "create", model: [touristAgencyInstance: touristAgencyInstance])
            return
        }
		if(null==session.admin){
			redirect(uri:'/')
		}
       else { flash.message = message(code: 'default.created.message', args: [message(code: 'touristAgency.label', default: 'TouristAgency'), touristAgencyInstance.id])
        redirect(action: "show", id: touristAgencyInstance.id)
       }
    }

    def show(Long id) {
        def touristAgencyInstance = TouristAgency.get(id)
        if (!touristAgencyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'touristAgency.label', default: 'TouristAgency'), id])
            redirect(action: "list")
            return
        }

        [touristAgencyInstance: touristAgencyInstance]
    }

    def edit(Long id) {
        def touristAgencyInstance = TouristAgency.get(id)
        if (!touristAgencyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'touristAgency.label', default: 'TouristAgency'), id])
            redirect(action: "list")
            return
        }

        [touristAgencyInstance: touristAgencyInstance]
    }

    def update(Long id, Long version) {
        def touristAgencyInstance = TouristAgency.get(id)
        if (!touristAgencyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'touristAgency.label', default: 'TouristAgency'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (touristAgencyInstance.version > version) {
                touristAgencyInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'touristAgency.label', default: 'TouristAgency')] as Object[],
                          "Another user has updated this TouristAgency while you were editing")
                render(view: "edit", model: [touristAgencyInstance: touristAgencyInstance])
                return
            }
        }

        touristAgencyInstance.properties = params

        if (!touristAgencyInstance.save(flush: true)) {
            render(view: "edit", model: [touristAgencyInstance: touristAgencyInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'touristAgency.label', default: 'TouristAgency'), touristAgencyInstance.id])
        redirect(action: "show", id: touristAgencyInstance.id)
    }

    def delete(Long id) {
        def touristAgencyInstance = TouristAgency.get(id)
        if (!touristAgencyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'touristAgency.label', default: 'TouristAgency'), id])
            redirect(action: "list")
            return
        }

        try {
            touristAgencyInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'touristAgency.label', default: 'TouristAgency'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'touristAgency.label', default: 'TouristAgency'), id])
            redirect(action: "show", id: id)
        }
    }
	
	
	
	def addWizard(){
			
	}
	
	def createAjaxAction() {
			render(view:"../action/index")
	}
	
	def registration_touristAgency(){
		[touristAgencyInstance: new TouristAgency(params)]
}
	
}
