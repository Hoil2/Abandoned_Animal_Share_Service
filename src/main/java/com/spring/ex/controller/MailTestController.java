package com.spring.ex.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MailTestController {
  
	@Autowired
	private JavaMailSenderImpl mailSender;
	
    static final String TO = "hoil20707@kyungmin.ac.kr";
	
	@RequestMapping("/mailTest")
	public String fileupload() throws Exception {
		
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
	        @Override
	        public void prepare(MimeMessage mimeMessage) throws Exception {
	            final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
	            helper.setFrom(mailSender.getUsername());
	            helper.setTo(TO);
	            helper.setSubject("test");
	            helper.setText("test content", true);
	        }
	    };

	    mailSender.send(preparator);
     
		
		return "mailTest";
	}
}

