package cw

import org.springframework.dao.DataIntegrityViolationException

class VacationPackageController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [vacationPackageInstanceList: VacationPackage.list(params), vacationPackageInstanceTotal: VacationPackage.count()]
    }

    def create() {
        [vacationPackageInstance: new VacationPackage(params)]
    }

    def save() {
        def vacationPackageInstance = new VacationPackage(params)
        if (!vacationPackageInstance.save(flush: true)) {
            render(view: "create", model: [vacationPackageInstance: vacationPackageInstance])
            return
        }
		if(session.touristAgency){
		 session.touristAgency.mapWizard.put("vacationPackage", vacationPackageInstance)
		 redirect(controller:"trip", action:"create")
		}
        else 
		{
		flash.message = message(code: 'default.created.message', args: [message(code: 'vacationPackage.label', default: 'VacationPackage'), vacationPackageInstance.id])
        redirect(action: "show", id: vacationPackageInstance.id)
		}
    }

    def show(Long id) {
        def vacationPackageInstance = VacationPackage.get(id)
        if (!vacationPackageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vacationPackage.label', default: 'VacationPackage'), id])
            redirect(action: "list")
            return
        }

        [vacationPackageInstance: vacationPackageInstance]
    }

    def edit(Long id) {
        def vacationPackageInstance = VacationPackage.get(id)
        if (!vacationPackageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vacationPackage.label', default: 'VacationPackage'), id])
            redirect(action: "list")
            return
        }

        [vacationPackageInstance: vacationPackageInstance]
    }

    def update(Long id, Long version) {
        def vacationPackageInstance = VacationPackage.get(id)
        if (!vacationPackageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vacationPackage.label', default: 'VacationPackage'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (vacationPackageInstance.version > version) {
                vacationPackageInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'vacationPackage.label', default: 'VacationPackage')] as Object[],
                          "Another user has updated this VacationPackage while you were editing")
                render(view: "edit", model: [vacationPackageInstance: vacationPackageInstance])
                return
            }
        }

        vacationPackageInstance.properties = params

        if (!vacationPackageInstance.save(flush: true)) {
            render(view: "edit", model: [vacationPackageInstance: vacationPackageInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'vacationPackage.label', default: 'VacationPackage'), vacationPackageInstance.id])
        redirect(action: "show", id: vacationPackageInstance.id)
    }

    def delete(Long id) {
        def vacationPackageInstance = VacationPackage.get(id)
        if (!vacationPackageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vacationPackage.label', default: 'VacationPackage'), id])
            redirect(action: "list")
            return
        }

        try {
            vacationPackageInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'vacationPackage.label', default: 'VacationPackage'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'vacationPackage.label', default: 'VacationPackage'), id])
            redirect(action: "show", id: id)
        }
    }
}
