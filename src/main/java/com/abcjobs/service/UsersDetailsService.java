package com.abcjobs.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abcjobs.model.UserDetails;
import com.abcjobs.repository.UsersDetailsRepository;

@Service
@Transactional
public class UsersDetailsService {
	
	@Autowired
	UsersDetailsRepository repo;
	
	public UserDetails register(UserDetails userDetails) {
		return repo.save(userDetails);
	}
	
	public String getDetailsById(String userId) {
		return repo.getDetailsbyId(userId);
	}
	
	public UserDetails updateProfile(Long userDetailsId, UserDetails ud) {
		UserDetails userDetails = repo.findById(userDetailsId).get();
		
		// update
		userDetails.setFirstName(ud.getFirstName());
		userDetails.setLastName(ud.getLastName());
		userDetails.setTitle(ud.getTitle());
		userDetails.setAbout(ud.getAbout());
		userDetails.setCompanyName(ud.getCompanyName());
		userDetails.setWebsite(ud.getWebsite());
		
		// save
 		return repo.save(userDetails);
	}
	
	public List<UserDetails> searchByKey(String key) {
		return repo.searchByKey(key);
	}
	
	public List<UserDetails> getAllUserDetails() {
		return repo.findAll();
	}
	
	public UserDetails getDetailsById(Long id) {
		return repo.findById(id).get();
	}

}
