/*
 * Source: https://www.javatpoint.com/example-of-sending-email-using-java-mail-api
 */

package my.third.party;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class SendEmail {  
	final String host="smtp.gmail.com";  
	final String user= "cinethisio7@gmail.com";
	final String password= "UIgx36IDK0";
	
	public boolean sendEmail(String recipient, String subject, String body ) {  
          		
		//recipient = "alexpap18@gmail.com";  
		//subject = "Test mail";
		//body = "simple message with JavaMail API";
		
		//Get the session object  
		Properties props = new Properties();  
		props.put("mail.smtp.host",host);  
		props.put("mail.smtp.auth", "true");  
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.starttls.enable", "true");

     
		Session session = Session.getDefaultInstance(props,new javax.mail.Authenticator() {  
			protected PasswordAuthentication getPasswordAuthentication() {  
				return new PasswordAuthentication(user,password);  
			}  
		});  
  
		//Compose the message  
		try {  
			MimeMessage message = new MimeMessage(session);  
			message.setFrom(new InternetAddress(user));  
			message.addRecipient(Message.RecipientType.TO,new InternetAddress(recipient));  
			message.setSubject(subject);  
			message.setContent(body, "text/html");  
   
			//send the message  
			Transport.send(message);  
  
			//System.out.println("mail sent successfully...");  
			return true;
   
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return false;
	}  
}  