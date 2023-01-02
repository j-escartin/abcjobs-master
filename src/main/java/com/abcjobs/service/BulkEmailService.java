package com.abcjobs.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.abcjobs.model.BulkEmail;
import com.abcjobs.model.Users;
import com.abcjobs.repository.BulkEmailRepository;
import com.abcjobs.repository.UsersRepository;

@Service
@Transactional
public class BulkEmailService {
	
	@Autowired
	BulkEmailRepository repo;
	
	@Autowired
	UsersRepository ur;
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	public boolean sendEmail(String subject, String body, String email) {
		List<Users> users = ur.findAll();
		
		try {
			if(email == null) {
				for(Users user : users) {
					SimpleMailMessage message = new SimpleMailMessage();
					message.setFrom("javines2403@gmail.com");
					message.setTo(user.getEmail());
					message.setSubject(subject);
					message.setText(body);
					
					mailSender.send(message);
					System.out.println(user.getEmail() + " -ok");
				}
			} else {
				SimpleMailMessage message = new SimpleMailMessage();
				message.setFrom("javines2403@gmail.com");
				message.setTo(email);
				message.setSubject(subject);
				message.setText(body);
				
				mailSender.send(message);
			}
		} catch(Exception e) {
			System.out.println(e); 	
		}
		
		return false;
	}
	
	public BulkEmail saveToDb(BulkEmail be) {
		return repo.save(be);
	}
	
	public List <BulkEmail> getEmail(){
		return repo.findAll();
	}
}
