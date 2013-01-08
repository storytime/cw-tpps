package cw

class MailSenderService {

    def sendMail() {
		def sc = new MailSenderController()
		sc.sendMail("VALID_MAIL@exmaple.com","Hello Serg","How are you?") 
    }
	
	
}
