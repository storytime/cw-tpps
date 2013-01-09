package cw

import org.springframework.dao.DataIntegrityViolationException

class UserController {
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    def create() {
        [userInstance: new User(params)]
    }

    def save() {
        def userInstance = new User(params)
        if (!userInstance.save(flush: true)) {
            render(view: "create", model: [userInstance: userInstance])
            return
        }
		if(null==session.admin){
			redirect(uri:'/')
		}
        else {flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
			  redirect(action: "show", id: userInstance.id)
        }
    }

    def show(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def edit(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def update(Long id, Long version) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "edit", model: [userInstance: userInstance])
                return
            }
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "edit", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def delete(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        try {
            userInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def doLogin() {
		def user = User.findWhere(name:params['name'],
			passwdHash:params['password'])
			if (user){
				session.user = user
				redirect(uri:'/')}
			else {
				def touristAgency=TouristAgency.findWhere(login:params['name'],
				passwdHash:params['password'])
				if (touristAgency){
					session.touristAgency = touristAgency
					redirect(uri:'/')}
					else{
						def admin=Admin.findWhere(login:params['name'],
							passwdHash:params['password'])
						if(admin){
							session.admin=admin
							redirect(uri:'/')
						}
						else {flash.message = "Incorrect login or password"
						redirect(uri:'/')
						}
						}
				}
	}

	def registration (){
		
	}
	
	def registration_user (){
		[userInstance: new User(params)]
	}
	
	def buy(Long id){
		def vacationPackage = VacationPackage.get(id)
		[vacationPackageBean:vacationPackage]
	}
	
	def sendMail(){
		
		String visa=params.get("visa")
		def ms =new MailSenderService()
        String ident=params.get("BuyVacationPackage")
    	def vacationPackage = VacationPackage.get(ident.toLong())
		print vacationPackage.priceFull
		String subject="You buy vacation package" 
		String body = 	"Print this ID=${visa} and show the landing of transport. You vacation package:Price: ${vacationPackage.priceFull}; start date: ${vacationPackage.startDate}; people: ${vacationPackage.people}"
		ms.sendMail(session.user.email, subject, body)
		
		User user = session.user
		if(!user.isAttached()){
			user.attach()
		}
		user.vacationPackages.add(vacationPackage)
			if (!user.save(flush: true)) {
			render("Fail save user but message send you")
		return
		}
	 redirect (uri:"/")
	}
	
}
