package com.abcjobs.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Configuration
@ComponentScan("com.abcjobs")
@EnableWebMvc
public class EmailConfig {
	
	@Bean
	public JavaMailSender getMail() {
		Properties props = new Properties();
		JavaMailSenderImpl mailsender = new JavaMailSenderImpl();
		
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.starttls.required", "true");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		
		mailsender.setJavaMailProperties(props);
		mailsender.setUsername("javines2403@gmail.com");
		mailsender.setPassword("oimghosrtluigpee");
		
		return mailsender;
	}

}
