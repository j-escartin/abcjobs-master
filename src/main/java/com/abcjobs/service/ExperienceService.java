package com.abcjobs.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abcjobs.model.Experiences;
import com.abcjobs.repository.ExperienceRepository;

@Service
@Transactional
public class ExperienceService {
	
	@Autowired
	ExperienceRepository repo;
	
	public List<Experiences> getExperiencesByUserDetailsId(String udID) {
		return repo.getExperiencesByUserDetailsId(udID);
	}
	
	public Experiences addExperience(Experiences ex) {
		return repo.save(ex);
	}
	
	
}
