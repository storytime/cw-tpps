package cw

import org.springframework.dao.DataIntegrityViolationException

class CharterController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [charterInstanceList: Charter.list(params), charterInstanceTotal: Charter.count()]
    }

    def create() {
        [charterInstance: new Charter(params)]
    }

    def save() {
        def charterInstance = new Charter(params)
        if (!charterInstance.save(flush: true)) {
            render(view: "create", model: [charterInstance: charterInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'charter.label', default: 'Charter'), charterInstance.id])
        redirect(action: "show", id: charterInstance.id)
    }

    def show(Long id) {
        def charterInstance = Charter.get(id)
        if (!charterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'charter.label', default: 'Charter'), id])
            redirect(action: "list")
            return
        }

        [charterInstance: charterInstance]
    }

    def edit(Long id) {
        def charterInstance = Charter.get(id)
        if (!charterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'charter.label', default: 'Charter'), id])
            redirect(action: "list")
            return
        }

        [charterInstance: charterInstance]
    }

    def update(Long id, Long version) {
        def charterInstance = Charter.get(id)
        if (!charterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'charter.label', default: 'Charter'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (charterInstance.version > version) {
                charterInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'charter.label', default: 'Charter')] as Object[],
                          "Another user has updated this Charter while you were editing")
                render(view: "edit", model: [charterInstance: charterInstance])
                return
            }
        }

        charterInstance.properties = params

        if (!charterInstance.save(flush: true)) {
            render(view: "edit", model: [charterInstance: charterInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'charter.label', default: 'Charter'), charterInstance.id])
        redirect(action: "show", id: charterInstance.id)
    }

    def delete(Long id) {
        def charterInstance = Charter.get(id)
        if (!charterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'charter.label', default: 'Charter'), id])
            redirect(action: "list")
            return
        }

        try {
            charterInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'charter.label', default: 'Charter'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'charter.label', default: 'Charter'), id])
            redirect(action: "show", id: id)
        }
    }
}
