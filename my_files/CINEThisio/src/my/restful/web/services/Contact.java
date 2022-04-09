package my.restful.web.services;

import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import my.third.party.SendEmail;

@Path("ContactService")
public class Contact {
	
	@POST
	@Path("/contactUs/{cName}/{cEmail}/{cMsg}")
	@Produces("text/plain")
	public String contactUs(@PathParam("cName") String cName, @PathParam("cEmail") String cEmail, @PathParam("cMsg") String cMsg) 
	{	
		cName = cName.replace("%20", " ");
		cEmail = cEmail.replace("%20", " ");
		cMsg = cMsg.replace("%20", " ");
		boolean flag = false;
		String out = "";
				
		SendEmail mail = new SendEmail();
		String recipient = "cinethisio7@gmail.com";  
		String subject = "New mail from the website contact form!";
		String body = "<strong>Name:</strong> "+cName+"<br>";
		body += "<strong>Email:</strong> "+cEmail+"<br>";
		body += "<strong>Message:</strong> "+cMsg+"<br>";
		
		flag = mail.sendEmail(recipient, subject, body);
		
		if(flag == true) {
			out = "We received your mail and we will reply you as soon as we can";
			
			//Auto Reply
			recipient = cEmail;
			//System.out.println(recipient);
			subject = "CINE Thisio - AutoReply";
			body = "Hi "+cName+",<br><br>";
			body += "Thsank you for your email.<br>We will reply you as soon as possible!<br><br>";
			body += "Best regards,<br>";
			body += "CINE Thisio<br>";
			body += "Ap. Pavlou 7, Thisio<br>Athens, 11851";
			mail.sendEmail(recipient, subject, body);
		} else {
			out = "ERROR !! The mail was not send. Try again later.";
		}
			
		return out;
	}

}
	