package com.esther.util;
	import javax.mail.*;
	import javax.mail.internet.InternetAddress;
	import javax.mail.internet.MimeMessage;

import com.esther.model.ReservationVO;

import java.util.Properties;
	public class SendMailForgot {
	    
	    public  int  sendmail(String email){
	    	final String username="webtask365";
	    	final String password="qwer123!@";
	        
	        Properties props = new Properties(); 
	        props.put("mail.smtp.user",username); 
	        props.put("mail.smtp.password", password);
	        props.put("mail.smtp.host", "smtp.gmail.com"); 
	        props.put("mail.smtp.port", "25"); 
	        props.put("mail.debug", "true"); 
	        props.put("mail.smtp.auth", "true"); 
	        props.put("mail.smtp.starttls.enable","true"); 
	        props.put("mail.smtp.EnableSSL.enable","true");
	        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
	        props.setProperty("mail.smtp.socketFactory.fallback", "false");   
	        props.setProperty("mail.smtp.port", "465");   
	        props.setProperty("mail.smtp.socketFactory.port", "465"); 
	    
	        Session session = Session.getInstance(props, new javax.mail.Authenticator() { 
	        protected PasswordAuthentication getPasswordAuthentication() { 
	        return new PasswordAuthentication(username, password); 
	        }});
	        
	        
	        try{
	            Message message = new MimeMessage(session); 
	            message.setFrom(new InternetAddress("webtask365@gmail.com", "webTask Reset password"));
	        	message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email)); 
	            message.setSubject("Reset your password");
	            message.setText("Dear, admin"   
	       //     message.setContent("Dear, customer"
	            		+ "\n\n Reset your password. "
	            		+ "\n\n Click the link below."
	            		+ "\n\n http://localhost:8080/adminBoard/reset ");
	      //      		+ "text/html; charset=utf-8");
	            //글내용을 html타입 charset설정
	            
	            Transport.send(message); 
	            System.out.println("SEND");
	            
	            return 1;
	        } catch(Exception e){
	        	e.printStackTrace();
	        	return 0;
	        }
//	        }catch(Exception e){
//	        	e.printStackTrace();
//	        	return 0;
//	        }
	    }    
	    
	}


