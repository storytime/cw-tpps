package cw

import org.springframework.dao.DataIntegrityViolationException

class HotNewsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [hotNewsInstanceList: HotNews.list(params), hotNewsInstanceTotal: HotNews.count()]
    }

    def create() {
        [hotNewsInstance: new HotNews(params)]
    }

    def save() {
        def hotNewsInstance = new HotNews(params)
        if (!hotNewsInstance.save(flush: true)) {
            render(view: "create", model: [hotNewsInstance: hotNewsInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'hotNews.label', default: 'HotNews'), hotNewsInstance.id])
        redirect(action: "show", id: hotNewsInstance.id)
    }

    def show(Long id) {
        def hotNewsInstance = HotNews.get(id)
        if (!hotNewsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hotNews.label', default: 'HotNews'), id])
            redirect(action: "list")
            return
        }

        [hotNewsInstance: hotNewsInstance]
    }

    def edit(Long id) {
        def hotNewsInstance = HotNews.get(id)
        if (!hotNewsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hotNews.label', default: 'HotNews'), id])
            redirect(action: "list")
            return
        }

        [hotNewsInstance: hotNewsInstance]
    }

    def update(Long id, Long version) {
        def hotNewsInstance = HotNews.get(id)
        if (!hotNewsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hotNews.label', default: 'HotNews'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (hotNewsInstance.version > version) {
                hotNewsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'hotNews.label', default: 'HotNews')] as Object[],
                          "Another user has updated this HotNews while you were editing")
                render(view: "edit", model: [hotNewsInstance: hotNewsInstance])
                return
            }
        }

        hotNewsInstance.properties = params

        if (!hotNewsInstance.save(flush: true)) {
            render(view: "edit", model: [hotNewsInstance: hotNewsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'hotNews.label', default: 'HotNews'), hotNewsInstance.id])
        redirect(action: "show", id: hotNewsInstance.id)
    }

    def delete(Long id) {
        def hotNewsInstance = HotNews.get(id)
        if (!hotNewsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hotNews.label', default: 'HotNews'), id])
            redirect(action: "list")
            return
        }

        try {
            hotNewsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'hotNews.label', default: 'HotNews'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'hotNews.label', default: 'HotNews'), id])
            redirect(action: "show", id: id)
        }
    }
}
