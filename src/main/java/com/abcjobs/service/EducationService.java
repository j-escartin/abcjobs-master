package com.abcjobs.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abcjobs.model.Educations;
import com.abcjobs.repository.EducationRepository;

@Service
@Transactional
public class EducationService{
	
	@Autowired
	EducationRepository repo;
	
	public Educations addEducation(Educations ed) {
		return repo.save(ed);
	}
	
	public List<Educations> getEducationByUserDetailsId(String userDetailsId){
		return repo.getEducationsByUserDetailsId(userDetailsId);
	}

}
