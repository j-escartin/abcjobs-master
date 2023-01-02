package com.abcjobs.controller;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.abcjobs.model.Educations;
import com.abcjobs.model.Experiences;
import com.abcjobs.model.UserDetails;
import com.abcjobs.service.EducationService;
import com.abcjobs.service.ExperienceService;
import com.abcjobs.service.UsersDetailsService;

@Controller
@Transactional
public class ProfileController {
	
	@Autowired
	UsersDetailsService ud;
	
	@Autowired
	EducationService eds;
	
	@Autowired
	ExperienceService exs;
	
	private void setModel(Model model, HttpSession session) {
		
		String userId = String.valueOf(session.getAttribute("userId"));
		String[] userDetails = ud.getDetailsById(userId).replaceAll("null", "-").split(",");
		String udID = userDetails[0];
		
		model.addAttribute("firstName", userDetails[1] );
		model.addAttribute("lastName", userDetails[2]);
		
		model.addAttribute("fullName", userDetails[1] + " " + userDetails[2]);
		model.addAttribute("title", userDetails[3]);
		model.addAttribute("about", userDetails[4]);
		model.addAttribute("company", userDetails[5]);
		model.addAttribute("website", userDetails[6]);

		model.addAttribute("email", session.getAttribute("email"));
		
		// experiences
		model.addAttribute("ex", exs.getExperiencesByUserDetailsId(udID)); // Experiences[]
		
		// educations
		model.addAttribute("ed", eds.getEducationByUserDetailsId(udID)); // Educations[]	
	}
	
	@RequestMapping(value = "/dashboard")
	public ModelAndView dashBoard(HttpSession session, Model model)throws Exception {
		try {
			this.setModel(model, session);
			return new ModelAndView("dashboard");
		} catch (Exception e) {
			System.out.println(e);
			String msg = "Login required";
			model.addAttribute("message", msg);
			return new ModelAndView("login");
		}
	}
	
	@RequestMapping(value = "/profile")
	public ModelAndView profile(HttpSession session, Model model)throws Exception {
		try {
			this.setModel(model, session);
			return new ModelAndView("profile");
		} catch (Exception e) {
			System.out.println(e);
			String msg = "Login required";
			model.addAttribute("message", msg);
			return new ModelAndView("login");
		}
	}
	
	@RequestMapping(value = "/updateProfile")
	public ModelAndView updateProfile(HttpSession session, Model model)throws Exception {
		try {
			this.setModel(model, session);
			return new ModelAndView("updateProfile");
		} catch (Exception e) {
			System.out.println(e);
			String msg = "Login required";
			model.addAttribute("message", msg);
			return new ModelAndView("login");
		}
	}
	
	
	
	@RequestMapping(value="/updateProfile", method = RequestMethod.POST) // update profile POST
	public String up(
			@ModelAttribute("profile") UserDetails userDetails,
			@RequestParam("position") String position, @RequestParam("startDateEX") String startDateEX, 
			@RequestParam("endDateEX") String endDateEX, @RequestParam("companyNameEX") String companyNameEX, 
			@RequestParam("intitutionName") String intitutionName, @RequestParam("startDateED") String startDateED, 
			@RequestParam("endDateED") String endDateED, @RequestParam("educationName") String educationName, 
			Experiences experiences, Educations educations,
			Model model, HttpSession session) {
		
		Long userDetailsId = Long.parseLong(String.valueOf(session.getAttribute("userId")));
		ud.updateProfile(userDetailsId, userDetails);
		
		
		if(position.equals("") || startDateEX.equals("") || endDateEX.equals("") || companyNameEX.equals("")) {
			System.out.println("Experiences Empty");
		} else {
			// exs.updateExperiences(String.valueOf(userDetailsId), experiences);
			
			experiences.setPosition(position);
			experiences.setStartDate(startDateEX);
			experiences.setEndDate(endDateEX);
			experiences.setCompanyName(companyNameEX);
			experiences.setUserDetailsId(String.valueOf(userDetailsId));
			
			exs.addExperience(experiences);
		}
		
		if(intitutionName.equals("") || startDateED.equals("") || endDateED.equals("") || educationName.equals("")) {
			System.out.println("Educations Empty");
		} else {
			educations.setEducationName(educationName);
			educations.setStartDate(startDateED);
			educations.setEndDate(endDateED);
			educations.setIntitutionName(intitutionName);
			educations.setUserDetailsId(String.valueOf(userDetailsId));
			
			eds.addEducation(educations);
		}
		
		this.setModel(model, session);
		
		String msg = "Profile has been updated";
		model.addAttribute("message", msg);
		return "dashboard";
	}
}
