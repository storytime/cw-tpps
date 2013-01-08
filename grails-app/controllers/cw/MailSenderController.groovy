package cw

class MailSenderController {
	def index() {
	}

	def callService = {
		def ms =new MailSenderService()
		ms.sendMail()
		render "call"
	}
	
	
	
	def sendMail(String addr,String sbj,String  bd) {
		sendMail {
			to addr
			subject sbj
			body bd
		}
		render "send"
	}
}
