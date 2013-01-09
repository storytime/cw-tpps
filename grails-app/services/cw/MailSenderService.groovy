package cw

class MailSenderService {

   def sendMail(String mail, String subject, String body) {
		def sc = new MailSenderController()
		sc.sendMail(mail,subject,body) 
    }

	
}
