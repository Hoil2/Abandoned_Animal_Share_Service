package com.spring.ex.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.spring.ex.dto.EmailDTO;

@Service
public class EmailService {
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	public void sendEmail(final EmailDTO dto) {
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
		    final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom(dto.getFrom());
				helper.setTo(dto.getTo());
				helper.setSubject(dto.getSubject());
				helper.setText(dto.getContents(), true);
			}
		};

		mailSender.send(preparator);
	}
	
	public String getAdminEmailAddress() {
		return mailSender.getUsername();
	}
}