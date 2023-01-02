package com.abcjobs.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.abcjobs.model.BulkEmail;
import com.abcjobs.model.Educations;
import com.abcjobs.model.Experiences;
import com.abcjobs.model.UserDetails;
import com.abcjobs.other.Profile;
import com.abcjobs.service.BulkEmailService;
import com.abcjobs.service.EducationService;
import com.abcjobs.service.ExperienceService;
import com.abcjobs.service.UsersDetailsService;
import com.abcjobs.service.UsersService;

@Controller
public class AdminController {
	
	@Autowired
	UsersService us;
	
	@Autowired
	UsersDetailsService ud;
	
	@Autowired
	ExperienceService ex;
	
	@Autowired
	EducationService ed;
	
	@Autowired
	BulkEmailService bs;
	
	@RequestMapping(value = "/admin-homepage")
	public ModelAndView adminHomepage(Model model, HttpSession session) {
		String userId = String.valueOf(session.getAttribute("userId"));
		String[] adminDetails = ud.getDetailsById(userId).replaceAll("null", "-").split(",");
		model.addAttribute("adminName", adminDetails[1] + " " + adminDetails[2]);
		return new ModelAndView("admin-homepage");
	}
	
	@RequestMapping(value = "/admin-allUser")
	public ModelAndView allUser(Model model, HttpSession session) {
		List<UserDetails> users = ud.getAllUserDetails();
		model.addAttribute("users", users);
		
		return new ModelAndView("admin-allUser");
	}
	
	@RequestMapping(value = "/delete/{id}")
	public String deleteUserById(@PathVariable("id") Long id, Model model) {
		boolean isDeleted = us.deleteUserById(id);
		if(isDeleted) {
			model.addAttribute("success", "The User was deleted");
			return "redirect:/admin-allUser";
		} else {
			model.addAttribute("error", "Cannot delete this user");
			return "redirect:/admin-allUser";
		}
	}
	
	@RequestMapping(value = "/profile/{id}")
	public ModelAndView profile(@PathVariable("id") Long id,Model model, HttpSession session, Profile profile) {
		UserDetails userDetails = ud.getDetailsById(id);
		List<Experiences> experiences = ex.getExperiencesByUserDetailsId(userDetails.getUserDetailsId().toString());
		List<Educations> educations = ed.getEducationByUserDetailsId(userDetails.getUserDetailsId().toString());
		
		profile.setId(userDetails.getUserDetailsId());
		profile.setFirstName(userDetails.getFirstName());
		profile.setLastName(userDetails.getLastName());
		profile.setFullName(userDetails.getFirstName() + " " + userDetails.getLastName());
		profile.setTitle(userDetails.getTitle());
		profile.setAbout(userDetails.getAbout());
		profile.setCompany(userDetails.getCompanyName());
		profile.setEmail(userDetails.getUser().getEmail());
		profile.setWebsite(userDetails.getWebsite());
		profile.setEx(experiences);
		profile.setEd(educations);
		
		this.setModel(profile, model, session);
		return new ModelAndView("admin-userProfile");
	}
	
	@RequestMapping(value="/update-profile", method = RequestMethod.POST) // update profile POST
	public String up(@ModelAttribute("profile") UserDetails userDetails, Model model, HttpSession session) {
		Long userDetailsId = userDetails.getUserDetailsId();
		ud.updateProfile(userDetailsId, userDetails);
		return "redirect:/admin-allUser";
	}
	
	@RequestMapping(value = "/send-bulk")
	public ModelAndView sendBulk(@ModelAttribute("sendBulk") BulkEmail email, HttpSession session) {
		return new ModelAndView("bulkEmail");
		
	}
	
	
	@RequestMapping(value = "/send-bulk", method = RequestMethod.POST)
	public String sb (@ModelAttribute("sendBulk") BulkEmail email, HttpSession session) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		
		email.setSendBy("1");
		email.setCreatedAt(dtf.format(now));
		bs.sendEmail(email.getEmailSubject(), email.getEmailBody(), null);
		
		bs.saveToDb(email);
		
		return "redirect:/admin-homepage";
	}
	
	private void setModel(Profile profile, Model model, HttpSession session) {
		model.addAttribute("id", profile.getId());
		
		model.addAttribute("firstName", profile.getFirstName());
		model.addAttribute("lastName", profile.getLastName());
		
		model.addAttribute("fullName", profile.getFullName());
		model.addAttribute("title", profile.getTitle());
		model.addAttribute("about", profile.getAbout());
		model.addAttribute("company", profile.getCompany());
		model.addAttribute("email", profile.getEmail());
		model.addAttribute("website", profile.getWebsite());
		
		// experiences
		model.addAttribute("ex", profile.getEx()); // Experiences[]
		
		// educations
		model.addAttribute("ed", profile.getEd()); // Educations[]
	}
}
 