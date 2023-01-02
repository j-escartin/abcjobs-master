package com.abcjobs.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.abcjobs.model.Educations;

public interface EducationRepository extends JpaRepository <Educations, Long>{
	@Query(value = "SELECT * FROM educations WHERE user_details_id = :udID", nativeQuery = true)
	public List<Educations> getEducationsByUserDetailsId(@Param("udID") String userDetailsId);
}
