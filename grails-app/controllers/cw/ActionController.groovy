package cw

import org.springframework.dao.DataIntegrityViolationException

class ActionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [actionInstanceList: Action.list(params), actionInstanceTotal: Action.count()]
    }

    def create() {
        [actionInstance: new Action(params)]
    }
	
	def createAjaxAction() {
		[actionInstance: new Action(params)]
	}
	
	def createAjaxCharter() {
		redirect(controller:"Charter",action:"createAjaxCharter");
	}

    def save() {
        def actionInstance = new Action(params)
        if (!actionInstance.save(flush: true)) {
            render(view: "create", model: [actionInstance: actionInstance])
            return
        }

        //flash.message = message(code: 'default.created.message', args: [message(code: 'action.label', default: 'Action'), actionInstance.id])
        if(session.touristAgency){
		flash.message="addAction";
		redirect(controller:"TouristAgency",action:"index");
        }
		else{
		redirect(action: "show", id: actionInstance.id)
		}
    }

    def show(Long id) {
        def actionInstance = Action.get(id)
        if (!actionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'action.label', default: 'Action'), id])
            redirect(action: "list")
            return
        }

        [actionInstance: actionInstance]
    }

    def edit(Long id) {
        def actionInstance = Action.get(id)
        if (!actionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'action.label', default: 'Action'), id])
            redirect(action: "list")
            return
        }

        [actionInstance: actionInstance]
    }

    def update(Long id, Long version) {
        def actionInstance = Action.get(id)
        if (!actionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'action.label', default: 'Action'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (actionInstance.version > version) {
                actionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'action.label', default: 'Action')] as Object[],
                          "Another user has updated this Action while you were editing")
                render(view: "edit", model: [actionInstance: actionInstance])
                return
            }
        }

        actionInstance.properties = params

        if (!actionInstance.save(flush: true)) {
            render(view: "edit", model: [actionInstance: actionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'action.label', default: 'Action'), actionInstance.id])
        redirect(action: "show", id: actionInstance.id)
    }

    def delete(Long id) {
        def actionInstance = Action.get(id)
        if (!actionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'action.label', default: 'Action'), id])
            redirect(action: "list")
            return
        }

        try {
            actionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'action.label', default: 'Action'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'action.label', default: 'Action'), id])
            redirect(action: "show", id: id)
        }
    }
}
